import 'package:flutter/material.dart';
import 'package:kpi/bloc/login_bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  final LoginBloc loginBloc;

  const LoginButton({Key key, this.loginBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: loginBloc.submitCheck,
      builder: (context, snapshot) {
        bool isEnabled = snapshot.data ?? false;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: RaisedButton(
            onPressed: isEnabled
                ? () {
              loginBloc.loginUser(context);
            }
                : null,
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: Colors.lightBlue,
            disabledColor: Colors.grey,
            child: Text(
              'LOGIN',
              style: TextStyle(
                  fontSize: 15, color: isEnabled? Colors.white: Colors.grey),
            ),
          ),
        );
      }
    );
  }
}
