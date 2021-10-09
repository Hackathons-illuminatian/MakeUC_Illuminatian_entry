import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SignInButton(
              text: "Sign Up!",
              height: 130.0,
              width: 350.0,
              font: 40.0,
              route: '/signup',
            ),
          ),
          Center(
            child: SignInButton(
              text: 'Sign In',
              height: 85.0,
              width: 170.0,
              font: 15.0,
              route: '/signin',
            ),
          )
        ],
      ),
    );
  }
}

class SignInButton extends StatefulWidget {
  final String text;
  final double height;
  final double width;
  final double font;
  final String route;

  const SignInButton(
      {Key? key,
      required this.text,
      required this.height,
      required this.width,
      required this.font,
      required this.route})
      : super(key: key);

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  double signInButtonShadow = 7.0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: Container(
            margin: EdgeInsets.all(30),
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
              signInButtonShadow = 3.0;
            });
            await Future.delayed(Duration(milliseconds: 200));
            setState(() {
              signInButtonShadow = 7.0;
              Navigator.pushReplacementNamed(context, widget.route);
            });
          },
          child: SizedBox(
            height: widget.height,
            width: widget.width,
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
