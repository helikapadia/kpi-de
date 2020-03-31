import 'dart:async';
import 'package:kpi/utility/constants.dart';

mixin RegisterationValidators {
  StreamTransformer<String, String> emailValidator =
  StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    String emailValidate =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(emailValidate);
    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError(EMAIL_ERROR);
    }
  });

  StreamTransformer<String, String> nameValidator =
  StreamTransformer<String, String>.fromHandlers(
      handleData: (name, sink) {
        if (name.length > 1) {
          sink.add(name);
        } else {
          sink.addError(FULL_NAME_ERROR);
        }
      });

  StreamTransformer<String, String> genderValidator =
  StreamTransformer<String, String>.fromHandlers(
      handleData: (gender, sink) {
        if (gender.length > 1) {
          sink.add(gender);
        } else {
          sink.addError(GENDER_ERROR);
        }
      });

  StreamTransformer<String, String> passwordValidator =
  StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
        String passwordValidate = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
        RegExp regExp = RegExp(passwordValidate);
        if (regExp.hasMatch(password)) {
          if (password.length >= 8 && password.length <= 30) {
            sink.add(password);
          } else {
            sink.addError(PASSWORD_ERROR);
          }
        } else {
          sink.addError(PASSWORD_ERROR);
        }
      });

  StreamTransformer<String, String> phoneNumberValidators =
  StreamTransformer<String, String>.fromHandlers(
      handleData: (phoneNumber, sink) {
        if (phoneNumber.length > 4) {
          sink.add(phoneNumber);
        } else {
          sink.addError(PHONE_NUMBER_ERROR);
        }
      });
}
