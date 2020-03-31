import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kpi/bloc/login_bloc/login_validator.dart';
import 'package:kpi/utility/app_helper.dart';
import 'package:kpi/utility/app_preferences.dart';
import 'package:kpi/utility/constants.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with LoginValidators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _showProgress = BehaviorSubject<bool>.seeded(false);
  final _isFromRegister = BehaviorSubject<bool>.seeded(false);

  Stream<String> get email => _emailController.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordController.stream.transform(passwordValidator);
  Stream<bool> get progress => _showProgress.stream;
  Stream<bool> get isFromRegister => _isFromRegister.stream;

  String get emailValue => _emailController.stream.value;
  String get passwordValue => _passwordController.stream.value;
  bool get progressBarValue => _showProgress.stream.value;
  bool get isFromRegisterValue => _isFromRegister.stream.value;

  Function(String) get emailChanged => _emailController.sink.add;
  Function(String) get passwordChanged => _passwordController.sink.add;
  Function(bool) get showProgress => _showProgress.sink.add;
  Function(bool) get isFromRegisterChanged => _isFromRegister.sink.add;

  Stream<bool> get submitCheck =>
      Rx.combineLatest2(email, password, (e, p) => true);

  void saveToken(String token) {
    AppPreferences.setString(APP_TOKEN, token);
  }

  void loginUser(BuildContext context) {
    showProgress(true);
    AppHelper.checkInternetConnection().then((isAvailable) {
      if (isAvailable) {
        FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailValue, password: passwordValue)
            .then((authResult) async {
          if (authResult.user.isEmailVerified) {
            await AppPreferences.setString(USER_EMAIL, authResult.user.uid);
            await Firestore.instance
                .collection(EMPLOYEE_COLLECTIONS)
                .document(authResult.user.uid)
                .updateData({
              IS_ACTIVE: true,
              IS_EMAIL_VERIFIED: true,
            }).then((value) async {
              await Firestore.instance
                  .collection(EMPLOYEE_COLLECTIONS)
                  .document(authResult.user.uid)
                  .get()
                  .then((documentSnapshot) async {
                await AppPreferences.setString(
                    USER_ID_KEY, documentSnapshot.data[USER_ID_KEY]);
                await AppPreferences.setString(
                    EMAIL_KEY, documentSnapshot.data[EMAIL_KEY]);
                await AppPreferences.setString(
                    NAME_KEY, documentSnapshot.data[NAME_KEY]);
                await AppPreferences.setString(
                    GENDER_KEY, documentSnapshot.data[GENDER_KEY]);
                if (documentSnapshot.data.containsKey(PHONE_NUMBER_KEY)) {
                  await AppPreferences.setString(PHONE_NUMBER_KEY,
                      documentSnapshot.data[PHONE_NUMBER_KEY]);
                }
              });
              showProgress(false);
              await Navigator.pushNamedAndRemoveUntil(
                  context, EMP_HOME_SCREEN, (route) => false);
            }).catchError((errors) {
              showProgress(false);
              showMessageDialog(errors.message, context);
            });
          } else {
            showProgress(false);
            showMessageDialog(EMAIL_NOT_VERIFIED, context);
          }
        }).catchError((errors) {
          showProgress(false);
          showMessageDialog(errors.message, context);
        });
      }
    });
  }

  void dispose() {
    _emailController?.close();
    _passwordController?.close();
    _showProgress?.close();
    _isFromRegister?.close();
  }
}
