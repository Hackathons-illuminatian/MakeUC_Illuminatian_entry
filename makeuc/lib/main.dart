import 'package:flutter/material.dart';
import 'package:makeuc/Services/google_signin.dart';
import 'package:provider/provider.dart';
import 'Services/RouteGenerator.dart';
import 'Services/Themes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          themeMode: ThemeMode.dark,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          onGenerateRoute: RouteGenerator.generateRoute,
        ),
      );
}
