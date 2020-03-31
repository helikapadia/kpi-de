import 'package:flutter/material.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_bloc.dart';

class RegisterationPhoneNumber extends StatelessWidget {

  final RegisterationBloc registerationBloc;

  const RegisterationPhoneNumber({Key key,@required this.registerationBloc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: StreamBuilder<String>(
        stream: registerationBloc.phoneNumber,
        builder: (context, snapshot) {
          return Container(
            height: snapshot.hasError? 70 :50,
            child: TextFormField(
              maxLength: 10,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.start,
              onChanged: (value){
                registerationBloc?.phoneNumberChanged(value);
              },
              decoration: InputDecoration(
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
                labelText: 'Mobile Number',
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

