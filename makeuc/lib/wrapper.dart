import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makeuc/Pages/Home.dart';
import 'package:makeuc/Pages/auth/Signin.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return HomePage();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                '''Something went wrong. Try again later.''',
                style: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                    fontFamily: "Pixel",
                    fontSize: 20),
              ),
            );
          } else {
            return Signin();
          }
        },
      ),
    );
  }
}
