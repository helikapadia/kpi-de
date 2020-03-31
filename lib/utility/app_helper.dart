import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppHelper {
  static void popupDialog(
      BuildContext context, String alertTitle, String alertBody) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(alertTitle),
            content: Text(alertBody),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Close"),
              )
            ],
          );
        });
  }

  static Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}

void showMessageDialog(String msg, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            msg,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.cyan,
            ),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: FlatButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            )
          ],
        );
      });
}

void showDialogAndNavigate(String msg, BuildContext context, String routeName) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            msg,
            style: const TextStyle(
                fontSize: 14, color: Colors.cyan),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: FlatButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, routeName);
                },
                child: const Text("OK"),
              ),
            )
          ],
        );
      });
}

void showDialogAndPop(String msg, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            msg,
            style: const TextStyle(
                fontSize: 14, color: Colors.cyan),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: FlatButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            )
          ],
        );
      });
}

void showDialogAndRemoveRoutes(
    String msg, BuildContext context, String routeName) {
  showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            msg,
            style: const TextStyle(
                fontSize: 14, color: Colors.cyan),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: FlatButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, routeName, (route) => false);
                },
                child: const Text("OK"),
              ),
            )
          ],
        );
      });
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}