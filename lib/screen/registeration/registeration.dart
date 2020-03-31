import 'package:flutter/material.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_bloc.dart';
import 'package:kpi/screen/registeration/register_text.dart';
import 'package:kpi/screen/registeration/registeration_confirm_password.dart';
import 'package:kpi/screen/registeration/registeration_email.dart';
import 'package:kpi/screen/registeration/registeration_gender.dart';
import 'package:kpi/screen/registeration/registeration_login.dart';
import 'package:kpi/screen/registeration/registeration_name.dart';
import 'package:kpi/screen/registeration/registeration_password.dart';
import 'package:kpi/screen/registeration/registeration_phone_number.dart';
import 'package:kpi/screen/registeration/registeration_progress_bar.dart';
import 'package:kpi/screen/registeration/registeration_signup.dart';
import 'package:kpi/utility/app_helper.dart';

class Registeration extends StatefulWidget {
  @override
  _RegisterationState createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  RegisterationBloc registerationBloc = RegisterationBloc();
  @override
  void dispose() {
    registerationBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: null,
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.white,
//          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: <Widget>[
              GestureDetector(
              onTap: () {
                  hideKeyboard(context);
                },
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      RegisterText(registerationBloc: registerationBloc,),
                      const SizedBox(
                        height: 40,
                      ),
                      RegisterationName(registerationBloc: registerationBloc,),
                      const SizedBox(
                        height: 10,
                      ),
                      RegisterationEmail(registerationBloc: registerationBloc,),
                      const SizedBox(
                        height: 10,
                      ),
                      RegisterationPhoneNumber(registerationBloc: registerationBloc,),
                      const SizedBox(
                        height: 10,
                      ),
                      RegisterationGender(registerationBloc: registerationBloc,),
                      const SizedBox(
                        height: 10,
                      ),
                      RegisterationPassword(registerationBloc: registerationBloc,),
                      const SizedBox(
                        height: 10,
                      ),
                      RegisterationConfirmPassword(registerationBloc: registerationBloc,),
                      const SizedBox(
                        height: 10,
                      ),
                      RegisterationSignUp(registerationBloc: registerationBloc,),
                      const SizedBox(
                        height: 10,
                      ),
                      RegisterationLogIn(registerationBloc: registerationBloc,),
                      const SizedBox(
                        height: 10,
                      ),
                      //RegisterationProgressBar(registerationBloc: registerationBloc,),
                    ],
                  ),
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
