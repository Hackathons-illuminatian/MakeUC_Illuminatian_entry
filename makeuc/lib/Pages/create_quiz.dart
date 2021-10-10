import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:makeuc/Pages/AddQuestion.dart';
import '../services/database.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:random_string/random_string.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  DatabaseService databaseService = new DatabaseService();
  final _formKey = GlobalKey<FormState>();
  late String quizTitle, quizDesc;
  String? quizId;
  double signInButtonShadow = 7;

  bool isLoading = false;

  createQuiz() {
    quizId = randomAlphaNumeric(16);
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      Map<String, String> quizData = {
        "quizTitle": quizTitle,
        "quizDesc": quizDesc,
        'quizId': quizId.toString()
      };

      databaseService.addQuizData(quizData, quizId.toString()).then((value) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AddQuestion(quizId: quizId.toString())));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text('Create quiz',
                            style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontFamily: 'Pixel',
                                fontSize: 30)),
                      ),
                      SizedBox(height: 30),
                      Text(
                        "Quiz Name:",
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontFamily: 'Pixel',
                            fontSize: 20),
                      ),
                      TextFormField(
                        cursorColor: Theme.of(context).shadowColor,
                        cursorWidth: 15,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(fontFamily: 'Pixel'),
                            focusColor: Theme.of(context).iconTheme.color,
                            fillColor: Theme.of(context).iconTheme.color,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: 'Quiz Name'),
                        style: TextStyle(
                            color: Theme.of(context).shadowColor,
                            fontFamily: 'Pixel',
                            fontSize: 18),
                        onChanged: (val) {
                          quizTitle = val;
                        },
                        validator: (val) =>
                            val!.isEmpty ? "Enter Quiz Title" : null,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Quiz Descrpition:",
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontFamily: 'Pixel',
                            fontSize: 20),
                      ),
                      TextFormField(
                        cursorColor: Theme.of(context).shadowColor,
                        cursorWidth: 15,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(fontFamily: 'Pixel'),
                            focusColor: Theme.of(context).iconTheme.color,
                            fillColor: Theme.of(context).iconTheme.color,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            hintText: 'Quiz Description'),
                        style: TextStyle(
                            color: Theme.of(context).shadowColor,
                            fontFamily: 'Pixel',
                            fontSize: 18),
                        onChanged: (val) {
                          quizDesc = val;
                        },
                        validator: (val) =>
                            val!.isEmpty ? "Enter Quiz Description" : null,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Spacer(),
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
                                        "Create Quiz",
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
                                  signInButtonShadow = 2.0;
                                });
                                await Future.delayed(
                                    Duration(milliseconds: 200));
                                setState(() {
                                  signInButtonShadow = 6.0;
                                });
                                createQuiz();
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
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
