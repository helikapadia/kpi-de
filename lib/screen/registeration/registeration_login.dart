import 'package:flutter/material.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_bloc.dart';
import 'package:kpi/utility/constants.dart';

class RegisterationLogIn extends StatelessWidget {
  final RegisterationBloc registerationBloc;

  const RegisterationLogIn({Key key,@required this.registerationBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Already have an Account?',
          style: TextStyle(color: Colors.black),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, LOGIN_ROUTE, arguments: true);
          },
          child: const Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 3, right: 8),
            child: Text('Sign In',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}

