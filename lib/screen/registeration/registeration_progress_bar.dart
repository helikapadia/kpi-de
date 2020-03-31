import 'package:flutter/material.dart';
import 'package:kpi/bloc/registeration_bloc/registeration_bloc.dart';
import 'package:kpi/screen/modal_progress_bar/modal_progress_bar.dart';

class RegisterationProgressBar extends StatelessWidget {
  const RegisterationProgressBar({@required this.registerationBloc,Key key}) : super(key: key);

  final RegisterationBloc registerationBloc;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: registerationBloc.progress,
        builder: (context, snapshot) {
          return ModalProgressBar(
            inAsyncCall: registerationBloc.progressBarValue,
            child: Container(),
          );
        }
    );
  }
}
