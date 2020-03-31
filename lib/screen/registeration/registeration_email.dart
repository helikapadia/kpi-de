import 'package:flutter/material.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_bloc.dart';

class RegisterationEmail extends StatelessWidget {

  final RegisterationBloc registerationBloc;

  const RegisterationEmail({Key key,@required this.registerationBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: StreamBuilder<String>(
        stream: registerationBloc.email,
        builder: (context, snapshot) {
          return Container(
            height: snapshot.hasError ? 70 : 50,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              onChanged: (value){
                registerationBloc?.emailChanged(value);
              },
              decoration: InputDecoration(
                suffixIcon: snapshot.hasError
                    ? Icon(
                  Icons.error,
                  color: Colors.red,
                )
                    : !snapshot.hasError &&
                    registerationBloc.emailValue != null
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
                labelText: 'Enter your email',
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
