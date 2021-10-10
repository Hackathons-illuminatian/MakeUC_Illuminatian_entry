import 'package:flutter/material.dart';
import 'package:makeuc/Services/google_signin.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createquiz');
        },
        backgroundColor: Theme.of(context).buttonColor,
        foregroundColor: Theme.of(context).iconTheme.color,
        focusColor: Theme.of(context).buttonColor,
        splashColor: Theme.of(context).buttonColor,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Text("Logout"))
        ],
      ),
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/createquiz');
                      },
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
