import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_bloc.dart';

class RegisterText extends StatelessWidget {
  final RegisterationBloc registerationBloc;

  const RegisterText({Key key,@required this.registerationBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 30),
      child: Text(
        'Sign Up',
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }
}
