import 'package:flutter/material.dart';
import 'package:makeuc/Services/database.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AddQuestion extends StatefulWidget {
  final String quizId;
  const AddQuestion({Key? key, required this.quizId}) : super(key: key);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  DatabaseService databaseService = new DatabaseService();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  late String question, option1, option2, option3, option4;

  uploadQuizData() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4
      };
      print("${widget.quizId}");

      databaseService.addQuestionData(questionMap, widget.quizId).then((value) {
        question = "";
        option1 = "";
        option2 = "";
        option3 = "";
        option4 = "";
        setState(() {
          isLoading = false;
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      print('error');
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
                        child: Text('Add Question',
                            style: TextStyle(
                                color: Theme.of(context).iconTheme.color,
                                fontFamily: 'Pixel',
                                fontSize: 23)),
                      ),
                      TextFormField(
                        cursorColor: Theme.of(context).shadowColor,
                        cursorWidth: 15,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(fontFamily: 'Pixel'),
                            focusColor: Theme.of(context).iconTheme.color,
                            fillColor: Theme.of(context).iconTheme.color,
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                            hintText: 'Question'),
                        style: TextStyle(
                            color: Theme.of(context).shadowColor,
                            fontFamily: 'Pixel',
                            fontSize: 10),
                        onChanged: (val) {
                          question = val;
                        },
                        validator: (val) =>
                            val!.isEmpty ? "Enter Question" : null,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: Theme.of(context).shadowColor,
                        cursorWidth: 15,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(fontFamily: 'Pixel'),
                            focusColor: Theme.of(context).iconTheme.color,
                            fillColor: Theme.of(context).iconTheme.color,
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                            hintText: 'option 1 (correct answer)'),
                        style: TextStyle(
                            color: Theme.of(context).shadowColor,
                            fontFamily: 'Pixel',
                            fontSize: 10),
                        onChanged: (val) {
                          option1 = val;
                        },
                        validator: (val) =>
                            val!.isEmpty ? "Enter a value" : null,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: Theme.of(context).shadowColor,
                        cursorWidth: 15,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(fontFamily: 'Pixel'),
                            focusColor: Theme.of(context).iconTheme.color,
                            fillColor: Theme.of(context).iconTheme.color,
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                            hintText: 'option 2'),
                        style: TextStyle(
                            color: Theme.of(context).shadowColor,
                            fontFamily: 'Pixel',
                            fontSize: 10),
                        onChanged: (val) {
                          option2 = val;
                        },
                        validator: (val) =>
                            val!.isEmpty ? "Enter a value" : null,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: Theme.of(context).shadowColor,
                        cursorWidth: 15,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(fontFamily: 'Pixel'),
                            focusColor: Theme.of(context).iconTheme.color,
                            fillColor: Theme.of(context).iconTheme.color,
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                            hintText: 'option 3'),
                        style: TextStyle(
                            color: Theme.of(context).shadowColor,
                            fontFamily: 'Pixel',
                            fontSize: 10),
                        onChanged: (val) {
                          option3 = val;
                        },
                        validator: (val) =>
                            val!.isEmpty ? "Enter a value" : null,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        cursorColor: Theme.of(context).shadowColor,
                        cursorWidth: 15,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(fontFamily: 'Pixel'),
                            focusColor: Theme.of(context).iconTheme.color,
                            fillColor: Theme.of(context).iconTheme.color,
                            contentPadding: EdgeInsets.symmetric(horizontal: 5),
                            hintText: 'option 4'),
                        style: TextStyle(
                            color: Theme.of(context).shadowColor,
                            fontFamily: 'Pixel',
                            fontSize: 10),
                        onChanged: (val) {
                          option4 = val;
                        },
                        validator: (val) =>
                            val!.isEmpty ? "Enter a value" : null,
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Btn(
                              text: 'Submit',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              uploadQuizData();
                            },
                            child: Btn(
                              text: 'Add Question',
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'these options will automatically shuffle in the app',
                        style: TextStyle(
                            fontFamily: 'Pixel',
                            fontSize: 10,
                            color: Theme.of(context).iconTheme.color),
                        textAlign: TextAlign.center,
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

class Btn extends StatefulWidget {
  final String text;
  const Btn({Key? key, required this.text}) : super(key: key);

  @override
  _BtnState createState() => _BtnState();
}

class _BtnState extends State<Btn> {
  double signInButtonShadow = 7;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        Positioned(
          child: GestureDetector(
            onTap: () async {
              setState(() {
                signInButtonShadow = 2.0;
              });
              await Future.delayed(Duration(milliseconds: 200));
              setState(() {
                signInButtonShadow = 6.0;
              });
            },
            child: SizedBox(
              height: 110,
              width: 120,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                decoration: ShapeDecoration(
                  shape: PixelBorder.solid(
                    color: Theme.of(context).shadowColor,
                    borderRadius: BorderRadius.circular(9.0),
                    pixelSize: 3.0,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
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
                        minFontSize: 10,
                      ),
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
          child: SizedBox(
            height: 110,
            width: 120 - 5,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 30),
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
                  height: 110 - 1,
                  width: 320,
                  child: Center(
                    child: AutoSizeText(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        fontFamily: 'Pixel',
                        fontSize: 10,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
