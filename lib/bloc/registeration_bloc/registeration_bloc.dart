import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_validator.dart';
import 'package:kpi/utility/app_helper.dart';
import 'package:kpi/utility/app_preferences.dart';
import 'package:kpi/utility/constants.dart';
import 'package:rxdart/rxdart.dart';

class RegisterationBloc with RegisterationValidators {
  final _emailController = BehaviorSubject<String>();
  final _nameController = BehaviorSubject<String>();
  final _genderController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();
  final _phoneNumber = BehaviorSubject<String>();
  final _showProgress = BehaviorSubject<bool>.seeded(false);

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get nameChanged => _nameController.sink.add;
  Function(String) get genderChanged => _genderController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  Function(String) get confirmPasswordChanged =>
      _confirmPasswordController.sink.add;
  Function(String) get phoneNumberChanged => _phoneNumber.sink.add;
  Function(bool) get showProgress => _showProgress.sink.add;

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get name => _nameController.stream.transform(nameValidator);
  Stream<String> get gender =>
      _genderController.stream.transform(genderValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);
  Stream<String> get confirmPassword =>
      _confirmPasswordController.stream.transform(passwordValidator);
  Stream<String> get phoneNumber => _phoneNumber.stream;
  Stream<bool> get progress => _showProgress.stream;

  String get emailValue => _emailController.stream.value;
  String get nameValue => _nameController.stream.value;
  String get genderValue => _genderController.stream.value;
  String get passwordValue => _passwordController.stream.value;
  String get confirmPasswordValue => _confirmPasswordController.stream.value;
  String get phoneNumberValue => _phoneNumber.stream.value;
  bool get progressBarValue => _showProgress.stream.value;

  Stream<bool> get submitCheck =>
      Rx.combineLatest5(email, name, gender, password,confirmPassword, (e, n, g, p,cp) => true);

  void registerUser(BuildContext context) {
    hideKeyboard(context);
    showProgress(true);
    AppHelper.checkInternetConnection().then((isAvailable) {
      if (isAvailable) {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: emailValue, password: passwordValue)
            .then((authResult) async {
          await authResult.user.sendEmailVerification();
          await AppPreferences.setString(USER_NAME, nameValue);
          await AppPreferences.setString(USER_EMAIL, emailValue);
          await AppPreferences.setString(USER_GENDER, genderValue);
          await AppPreferences.setString(USER_PHONE_NUMBER, phoneNumberValue);

          await Firestore.instance
              .collection(EMPLOYEE_COLLECTIONS)
              .document(authResult.user.uid)
              .setData({
            EMAIL_KEY: emailValue,
            GENDER_KEY: genderValue,
            NAME_KEY: nameValue,
            USER_ID_KEY: authResult.user.uid,
            PHONE_NUMBER_KEY: phoneNumber,
            IS_ACTIVE: false,
            IS_EMAIL_VERIFIED: false,
            DATE_SIGN_UP: FieldValue.serverTimestamp(),
            USER_TYPE: EMPLOYEE,
          }).then((isCompleted) {
            showProgress(false);
            showDialogAndNavigate(PLEASE_CHECK_YOUR_MAIL_FOR_VERIFICATION,
                context, LOGIN_ROUTE);
          }).catchError((error) {
            showProgress(false);
            showMessageDialog(error.message, context);
          });
        }).catchError((errors) {
          showProgress(false);
          showMessageDialog(errors.message, context);
        });
      } else {
        showProgress(false);
        showMessageDialog(PLEASE_CHECK_INTERNET_CONNECTION, context);
      }
    });
  }

  void dispose() {
    _emailController?.close();
    _nameController?.close();
    _genderController?.close();
    _passwordController?.close();
    _confirmPasswordController?.close();
    _phoneNumber?.close();
    _showProgress?.close();
  }
}
