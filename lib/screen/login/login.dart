import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kpi/bloc/login_bloc/login_bloc.dart';
import 'package:kpi/screen/login/login_button.dart';
import 'package:kpi/screen/login/login_email.dart';
import 'package:kpi/screen/login/login_forget_password_button.dart';
import 'package:kpi/screen/login/login_password.dart';
import 'package:kpi/screen/login/login_progress_bar.dart';
import 'package:kpi/screen/login/login_text.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginBloc loginBloc = LoginBloc();
  @override
  void dispose(){
    loginBloc?.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: null,
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  LoginText(loginBloc:loginBloc),
                  const SizedBox(height: 10,),
                  Form(
                      child: Material(
                        color: Colors.white,
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(
                                height: 10,
                              ),
                              LoginEmail(loginBloc: loginBloc,),
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              LoginPassword(loginBloc: loginBloc,),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      )
                  ),
                  LoginForgetPasswordButton(loginBloc: loginBloc,),
                  //LoginProgressBar(loginBloc: loginBloc,),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  LoginButton(loginBloc: loginBloc,),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}
