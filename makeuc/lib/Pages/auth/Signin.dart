import 'package:flutter/material.dart';
import 'package:makeuc/Services/email_signin.dart';
import 'package:makeuc/Services/google_signin.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final double spacing = 40.0;
  bool _passwordVisible = true;
  final _text = TextEditingController();
  bool _validate = false;
  String error = '';
  final _formkey = GlobalKey<FormState>();
  double signInButtonShadow = 7.0;

  // text field state
  String _email = '';
  String _password = '';

  // ignore: must_call_super
  void initState() {
    _passwordVisible = true;
    _passwordVisible = true;
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Padding(
          padding: const EdgeInsets.all(35.0),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Text('SignIn',
                          style: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                              fontFamily: 'Pixel',
                              fontSize: 35)),
                    ),
                    SizedBox(height: 30),
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
                            obscureText: _passwordVisible,
                            cursorColor: Theme.of(context).shadowColor,
                            cursorWidth: 15,
                            decoration: InputDecoration(
                                focusColor: Theme.of(context).iconTheme.color,
                                fillColor: Theme.of(context).iconTheme.color,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 10),
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
                            _passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Stack(children: [
                        Positioned(
                          child: SizedBox(
                            height: 110,
                            width: 320,
                            child: Container(
                              margin: EdgeInsets.all(30),
                              decoration: ShapeDecoration(
                                shape: PixelBorder.solid(
                                  color: Theme.of(context).shadowColor,
                                  borderRadius: BorderRadius.circular(9.0),
                                  pixelSize: 3.0,
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                color: Theme.of(context).shadowColor,
                                child: Center(
                                  child: FittedBox(
                                    child: AutoSizeText(
                                      "Signin with email",
                                      style: TextStyle(
                                        color: Theme.of(context).shadowColor,
                                        fontFamily: 'Pixel',
                                      ),
                                      maxLines: 2,
                                      maxFontSize: 100,
                                      minFontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: signInButtonShadow,
                          bottom: signInButtonShadow,
                          child: GestureDetector(
                            onTap: () async {
                              setState(() {
                                signInButtonShadow = 3.0;
                              });
                              await Future.delayed(Duration(milliseconds: 200));
                              setState(() {
                                signInButtonShadow = 7.0;
                              });
                              submit();
                            },
                            child: SizedBox(
                              height: 110,
                              width: 320 - 30,
                              child: Container(
                                margin: EdgeInsets.all(30),
                                decoration: ShapeDecoration(
                                  shape: PixelBorder.solid(
                                    color: Theme.of(context).iconTheme.color!,
                                    borderRadius: BorderRadius.circular(6.0),
                                    pixelSize: 3.0,
                                  ),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(1),
                                  color: Theme.of(context).iconTheme.color!,
                                  child: SizedBox(
                                    height: 110 - 30,
                                    width: 320,
                                    child: Center(
                                      child: AutoSizeText(
                                        "Signin with email",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          fontFamily: 'Pixel',
                                          fontSize: 14,
                                        ),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Center(
                      child: SignInButton(
                        text: "Sign In with Google",
                        height: 60,
                        width: 210,
                        font: 10,
                      ),
                    ),
                  ]),
            ),
          ),
        ));
  }

  Future submit() async {
    final provider = Provider.of<EmailSignInProvider>(context, listen: false);
    final isSuccess = await provider.login();

    if (isSuccess) {
      Navigator.of(context).pop();
    } else {
      final message = "An error occured. Please check your credentials";
      _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
    }
  }
}

class SignInButton extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final double font;

  const SignInButton({
    Key? key,
    required this.text,
    required this.height,
    required this.width,
    required this.font,
  }) : super(key: key);

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  double signInButtonShadow = 6.0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        child: SizedBox(
          height: widget.height,
          width: widget.width + 1,
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: ShapeDecoration(
              shape: PixelBorder.solid(
                color: Theme.of(context).shadowColor,
                borderRadius: BorderRadius.circular(6.0),
                pixelSize: 3.0,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              color: Theme.of(context).shadowColor,
              child: Center(
                child: FittedBox(
                  child: AutoSizeText(
                    widget.text,
                    style: TextStyle(
                      color: Theme.of(context).shadowColor,
                      fontFamily: 'Pixel',
                    ),
                    maxLines: 2,
                    maxFontSize: 100,
                    minFontSize: widget.font,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        right: signInButtonShadow,
        bottom: signInButtonShadow,
        child: GestureDetector(
          onTap: () async {
            setState(() {
              signInButtonShadow = 2.0;
            });
            await Future.delayed(Duration(milliseconds: 200));
            setState(() {
              signInButtonShadow = 6.0;
            });
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
          child: SizedBox(
            height: widget.height,
            width: widget.width,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: ShapeDecoration(
                shape: PixelBorder.solid(
                  color: Theme.of(context).iconTheme.color!,
                  borderRadius: BorderRadius.circular(6.0),
                  pixelSize: 3.0,
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(1),
                color: Theme.of(context).iconTheme.color!,
                child: SizedBox(
                  height: widget.height,
                  width: widget.width,
                  child: Center(
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontFamily: 'Pixel',
                        fontSize: widget.font,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
