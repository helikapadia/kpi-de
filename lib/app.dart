import 'package:flutter/material.dart';
import 'package:kpi/screen/login/login.dart';
import 'package:kpi/screen/registeration/registeration.dart';
import 'package:kpi/utility/constants.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Key Performace Indicator',
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: routes,
      onUnknownRoute: unknownRoutes,
    );
  }

  Route unknownRoutes(RouteSettings routeSettings)
  {
    return MaterialPageRoute(builder: (context){
      return Registeration();
    });
  }

  Route routes(RouteSettings settings)
  {
    switch (settings.name){
      case "/":
        return MaterialPageRoute(builder: (context){
          return Registeration();
        });
        break;
      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (context){
          return Login();
        });
        break;
      default:
        return MaterialPageRoute(builder: (context){
          return Registeration();
        });
        break;
    }
  }
}
