import 'package:flutter/material.dart';
import 'Services/RouteGenerator.dart';
import 'Services/Themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: "/signup",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
