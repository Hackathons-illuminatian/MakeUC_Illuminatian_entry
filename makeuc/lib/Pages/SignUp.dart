import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final double spacing = 40.0;
  bool _passwordVisible = true;
  bool _passwordVisibleFirst = true;
  final _text = TextEditingController();
  bool _validate = false;
  String error = '';
  final _formkey = GlobalKey<FormState>();

  // text field state
  String _email = '';
  String _password = '';

  // ignore: must_call_super
  void initState() {
    _passwordVisible = true;
    _passwordVisibleFirst = true;
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(35.0),
      child: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text('SignUp',
                style: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                    fontFamily: 'Pixel',
                    fontSize: 35)),
          ),
          SizedBox(height: 30),
          Text(
            "Enter your name:",
            style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontFamily: 'Pixel',
                fontSize: 20),
          ),
          TextFormField(
            cursorColor: Theme.of(context).shadowColor,
            cursorWidth: 15,
            decoration: InputDecoration(
                focusColor: Theme.of(context).iconTheme.color,
                fillColor: Theme.of(context).iconTheme.color,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: 'John Doe'),
            style: TextStyle(
                color: Theme.of(context).shadowColor,
                fontFamily: 'Pixel',
                fontSize: 18),
          ),
          SizedBox(
            height: spacing,
          ),
          Text(
            "Email:",
            style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontFamily: 'Pixel',
                fontSize: 20),
          ),
          TextFormField(
            cursorColor: Theme.of(context).shadowColor,
            cursorWidth: 15,
            decoration: InputDecoration(
                focusColor: Theme.of(context).iconTheme.color,
                fillColor: Theme.of(context).iconTheme.color,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintText: 'John.Doe@example.com'),
            style: TextStyle(
                color: Theme.of(context).shadowColor,
                fontFamily: 'Pixel',
                fontSize: 18),
          ),
          SizedBox(
            height: spacing,
          ),
          Text(
            "Password:",
            style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontFamily: 'Pixel',
                fontSize: 20),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  key: _formkey,
                  obscureText: _passwordVisibleFirst,
                  cursorColor: Theme.of(context).shadowColor,
                  cursorWidth: 15,
                  decoration: InputDecoration(
                      focusColor: Theme.of(context).iconTheme.color,
                      fillColor: Theme.of(context).iconTheme.color,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      hintText: 'password'),
                  style: TextStyle(
                      color: Theme.of(context).shadowColor,
                      fontFamily: 'Pixel',
                      fontSize: 18),
                  validator: (val) =>
                      val!.length < 6 ? 'Password too short.' : null,
                  onSaved: (val) => _password = val!,
                ),
              ),
              IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisibleFirst
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Theme.of(context).shadowColor,
                  size: 23,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisibleFirst = !_passwordVisibleFirst;
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: spacing,
          ),
          Text(
            "Confirm Password:",
            style: TextStyle(
                color: Theme.of(context).iconTheme.color,
                fontFamily: 'Pixel',
                fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  obscureText: _passwordVisible,
                  cursorColor: Theme.of(context).shadowColor,
                  cursorWidth: 15,
                  decoration: InputDecoration(
                    focusColor: Theme.of(context).iconTheme.color,
                    fillColor: Theme.of(context).iconTheme.color,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    hintText: 'password',
                  ),
                  style: TextStyle(
                      color: Theme.of(context).shadowColor,
                      fontFamily: 'Pixel',
                      fontSize: 18),
                ),
              ),
              IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  _passwordVisible ? Icons.visibility_off : Icons.visibility,
                  color: Theme.of(context).shadowColor,
                  size: 23,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20.0),
        ]),
      ),
    ));
  }
}
