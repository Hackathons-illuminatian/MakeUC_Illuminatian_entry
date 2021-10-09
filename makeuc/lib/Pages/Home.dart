import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(30),
                    decoration: ShapeDecoration(
                      shape: PixelBorder.solid(
                        color: Theme.of(context).iconTheme.color!,
                        borderRadius: BorderRadius.circular(15.0),
                        pixelSize: 5.0,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      color: Theme.of(context).iconTheme.color!,
                      child: Text(
                        "yee",
                        style: TextStyle(
                            color: Color(0xFF2F1E3F),
                            fontSize: 50,
                            fontFamily: 'Pixel'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
