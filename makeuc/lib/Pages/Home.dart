import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:makeuc/Pages/PlayQuiz.dart';
import 'package:makeuc/Services/database.dart';
import 'package:makeuc/Services/google_signin.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Stream? quizzes;
  List? item;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/createquiz');
        },
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).iconTheme.color,
        focusColor: Theme.of(context).buttonColor,
        splashColor: Theme.of(context).buttonColor,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(fontFamily: "Pixel"),
        ),
        actions: [
          TextButton(
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
              },
              child: Text("Logout", style: TextStyle(fontFamily: "Pixel")))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('Quiz').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuizPlay(
                                (doc.data() as Map)['quizId'].toString())));
                  },
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.play_arrow),
                      title: Text(
                        (doc.data() as Map)['quizTitle'],
                        style: TextStyle(fontFamily: "Pixel"),
                      ),
                      subtitle: Text(
                        (doc.data() as Map)['quizDesc'],
                        style: TextStyle(fontFamily: "Pixel"),
                      ),
                      tileColor: Theme.of(context).buttonColor,
                    ),
                  ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}
