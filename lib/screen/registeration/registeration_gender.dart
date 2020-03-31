import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_bloc.dart';
import 'package:kpi/utility/constants.dart';

class RegisterationGender extends StatelessWidget {
  final RegisterationBloc registerationBloc;

  const RegisterationGender({Key key, @required this.registerationBloc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              GENDER,
              style: TextStyle(color: Color(0xFFA9A9A9)),
            ),
          ),
          StreamBuilder<String>(
              stream: registerationBloc.gender,
              builder: (context, snapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Radio(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: MALE,
                      groupValue: registerationBloc?.genderValue ?? GENDER,
                      onChanged: changeGender,
                      activeColor: Colors.blueAccent,
                    ),
                    Text(
                      MALE,
                      style: TextStyle(color: Colors.black),
                    ),
                    Radio(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      value: FEMALE,
                      groupValue: registerationBloc?.genderValue ?? GENDER,
                      activeColor: Colors.blueAccent,
                      hoverColor: Colors.yellow,
                      onChanged: changeGender,
                    ),
                    Text(
                      FEMALE,
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }

  void changeGender(String value) {
    value == MALE
        ? registerationBloc?.genderChanged(MALE)
        : registerationBloc?.genderChanged(FEMALE);
  }
}
