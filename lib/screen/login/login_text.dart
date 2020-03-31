import 'package:flutter/material.dart';
import 'package:kpi/bloc/login_bloc/login_bloc.dart';

class LoginText extends StatelessWidget {
  final LoginBloc loginBloc;

  const LoginText({Key key, this.loginBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30),
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 40,
          color: Colors.black,
        ),
      ),
    );
  }
}
