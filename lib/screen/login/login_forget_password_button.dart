import 'package:flutter/material.dart';
import 'package:kpi/bloc/login_bloc/login_bloc.dart';
import 'package:kpi/utility/constants.dart';

class LoginForgetPasswordButton extends StatelessWidget {
  final LoginBloc loginBloc;

  const LoginForgetPasswordButton({Key key, this.loginBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: FlatButton(
          onPressed: () =>
              Navigator.pushNamed(context, EMP_FORGOT_PASSWORD_ROUTE),
          child:  Text(
            FORGOT_PASSWORD,
            style: TextStyle(color: Colors.black ),
          ),
        ),
      ),
    );
  }
}
