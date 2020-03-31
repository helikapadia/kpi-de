import 'package:flutter/material.dart';
import 'package:kpi/bloc/login_bloc/login_bloc.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_bloc.dart';
import 'package:kpi/screen/modal_progress_bar/modal_progress_bar.dart';

class LoginProgressBar extends StatelessWidget {
  const LoginProgressBar({@required this.loginBloc,Key key}) : super(key: key);

  final LoginBloc loginBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: loginBloc.progress,
        builder: (context, snapshot) {
          return ModalProgressBar(
            inAsyncCall: loginBloc.progressBarValue,
            child: Container(),
          );
        }
    );
  }
}
