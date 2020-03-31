import 'package:flutter/material.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_bloc.dart';

class RegisterationPassword extends StatelessWidget {

  final RegisterationBloc registerationBloc;

  const RegisterationPassword({Key key,@required this.registerationBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: StreamBuilder<String>(
        stream: registerationBloc.password,
        builder: (context, snapshot) {
          return Container(
            height: snapshot.hasError? 70 : 50,
            child: TextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              obscureText: true,
              onChanged: (value){
                registerationBloc?.passwordChanged(value);
              },
              decoration: InputDecoration(
                suffixIcon: snapshot.hasError
                    ? Icon(
                  Icons.error,
                  color: Colors.red,
                )
                    : !snapshot.hasError &&
                    registerationBloc.passwordValue != null
                    ? Icon(
                  Icons.check,
                  color: Colors.green,
                )
                    : null,
                enabledBorder: const OutlineInputBorder(
                    borderRadius:  BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide:  BorderSide(
                        color: Color(0xFFF0F0F0), width: 2)),
                border: const OutlineInputBorder(
                    borderRadius:  BorderRadius.all(
                      Radius.circular(25),
                    ),
                    borderSide:  BorderSide(
                        color: Color(0xFFF0F0F0), width: 2)),
                labelText: 'Password',
                labelStyle: const TextStyle(
                  color: Color(0xFFA9A9A9),
                ),
                errorText:snapshot.error,
              ),
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          );
        }
      ),
    );
  }
}

