import 'package:flutter/material.dart';
import 'package:academicbuddy/login_page.dart';
import 'package:academicbuddy/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance.collection('users')
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return new Text('Loading...');
              default:
                return new ListView(
                  children: snapshot.data.documents
                      .map((DocumentSnapshot document) {
                    return Container(

                    );

                  }).toList(),
                );
            }
          },
        )),

    );
  }
}
