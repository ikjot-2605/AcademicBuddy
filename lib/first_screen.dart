import 'package:flutter/material.dart';
import 'package:academicbuddy/login_page.dart';
import 'package:academicbuddy/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'nav_drawer.dart';
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<QuerySnapshot> docRef = Firestore.instance
        .collection("users")
        .where("id", isEqualTo: id)
        .getDocuments();
    String greeting = 'Welcome $name';
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: Color(0xFF000000),
        accentColor: Colors.white,
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black54,
      ),
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(backgroundColor: Colors.grey[900], actions: <Widget>[
          // action button
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Welcome $name'),
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: (){
                  signOutGoogle();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
