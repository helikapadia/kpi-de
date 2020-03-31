import 'package:flutter/material.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_bloc.dart';

class RegisterationSignUp extends StatelessWidget {
  final RegisterationBloc registerationBloc;

  const RegisterationSignUp({Key key, @required this.registerationBloc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: registerationBloc.submitCheck,
        builder: (context, snapshot) {
          bool isEnabled;
          if (snapshot.hasData) {
            isEnabled = snapshot.data &&
                registerationBloc.passwordValue ==
                    registerationBloc.confirmPasswordValue;
          } else {
            isEnabled = false;
          }
          return FlatButton(
            onPressed: isEnabled
                ? () {
                    registerationBloc.registerUser(context);
                  }
                : null,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              child: Material(
                borderRadius: BorderRadius.circular(25),
                elevation: 4,
                color: isEnabled ? const Color(0xFF399CFF) : Colors.grey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
