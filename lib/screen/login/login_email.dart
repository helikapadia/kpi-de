import 'package:flutter/material.dart';
import 'package:kpi/bloc/login_bloc/login_bloc.dart';

class LoginEmail extends StatelessWidget {
  final LoginBloc loginBloc;

  const LoginEmail({Key key, this.loginBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: loginBloc.email,
      builder: (context, snapshot) {
        return Container(
          height: snapshot.hasError ? 70: 50,
          child: Row(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                  flex: 1,
                  child: Text('Your Email', style: TextStyle(color: Colors.grey))),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 3,
                child: TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  onChanged: (value) {
                    loginBloc?.emailChanged(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    enabledBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide: BorderSide(color: Colors.transparent, width: 0),
                    ),
                    errorBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide: BorderSide(color: Colors.transparent, width: 0),
                    ),
                    errorText:snapshot.error,
                    errorStyle: const TextStyle(fontSize: 8),
                  ),
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
