import 'package:flutter/material.dart';
import 'package:kpi/bloc/login_bloc/login_bloc.dart';

class LoginPassword extends StatelessWidget {
  final LoginBloc loginBloc;

  const LoginPassword({Key key, this.loginBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: loginBloc.password,
      builder: (context, snapshot) {
        return Container(
          child: Row(
            children: <Widget>[
              const SizedBox(
                width: 4,
              ),
              const Expanded(
                  flex: 2,
                  child: Text(
                    'Your Password',
                    style: TextStyle(
                        color: Colors.grey),
                  )),
              const SizedBox(
                width: 1,
              ),
              Expanded(
                flex: 4,
                child: TextFormField(
                  maxLines: 1,
                  obscureText: true,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onChanged: (value){
                    loginBloc?.passwordChanged(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'password',
                    enabledBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide: BorderSide(color: Colors.transparent, width: 0),
                    ),
                    errorBorder: const OutlineInputBorder(
                      // width: 0.0 produces a thin "hairline" border
                      borderSide: BorderSide(color: Colors.transparent, width: 0),
                    ),
                    errorText: snapshot.error,
                    errorStyle: const TextStyle(fontSize: 8),
                  ),
                  style: TextStyle(
                      color: Colors.black,),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
