import 'package:flutter/material.dart';
import 'package:makeuc/wrapper.dart';

import '../Pages/Home.dart';
import '../Pages/auth/SignUp.dart';
import '../Pages/auth/Signin.dart';
import '../Pages/Welcome.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Welcome());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/signin':
        return MaterialPageRoute(builder: (_) => Wrapper());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
