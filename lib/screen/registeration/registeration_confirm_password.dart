import 'package:flutter/material.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_bloc.dart';
import 'package:kpi/utility/app_helper.dart';
import 'package:kpi/utility/constants.dart';

class RegisterationConfirmPassword extends StatelessWidget {
  final RegisterationBloc registerationBloc;

  const RegisterationConfirmPassword({Key key, this.registerationBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: StreamBuilder<String>(
          stream: registerationBloc.confirmPassword,
          builder: (context, snapshot) {
            return Container(
              height: snapshot.hasError
                  ? 70
                  : registerationBloc.confirmPasswordValue !=
                  registerationBloc.passwordValue
                  ? 70
                  : 50,
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (value) {
                  hideKeyboard(context);
                },
                obscureText: true,
                textAlign: TextAlign.start,
                onChanged: (value) {
                  registerationBloc.confirmPasswordChanged(value);
                },
                decoration: InputDecoration(
                  suffixIcon: snapshot.hasError &&
                      registerationBloc.confirmPasswordValue ==
                          null ||
                      registerationBloc.confirmPasswordValue !=
                          registerationBloc.passwordValue
                      ? Icon(
                    Icons.error,
                    color: Colors.red,
                  )
                      : !snapshot.hasError &&
                      registerationBloc.confirmPasswordValue !=
                          null
                      ? Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                      : null,
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      borderSide:
                      BorderSide(color: Color(0xFFF0F0F0), width: 2)),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      borderSide:
                      BorderSide(color: Color(0xFFF0F0F0), width: 2)),
                  labelText: CONFIRM_PASSWORD,
                  labelStyle: const TextStyle(color: Color(0xFFA9A9A9)),
                  errorText: snapshot.hasError
                      ? snapshot.error
                      : registerationBloc.confirmPasswordValue !=
                      registerationBloc.passwordValue
                      ? "Password Mismatch"
                      : null,
                  errorStyle: const TextStyle(fontSize: 8),
                ),
                style: TextStyle(
                    color: Colors.black),
              ),
            );
          }),
    );
  }
}
