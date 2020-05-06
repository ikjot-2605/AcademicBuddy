import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'sign_in.dart';
import 'branch_year.dart';
import 'first_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String identified = '';
/*Future<String> getBranchName() async {
  DocumentSnapshot snapshot= await Firestore.instance.collection('users').document(id).get();
  var channelName = snapshot['branch'];
  if (channelName is String) {
    return channelName;
  }
}*/
var databaseReference = Firestore.instance;
List assignments = new List();

class Assignment extends StatefulWidget {
  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  Future<String> getStringValuesSF() async {
    final prefs = await SharedPreferences.getInstance();
    final stringValue = await prefs.getString('stringValue');
    setState(() {
      identified = stringValue;
    });
    return stringValue ?? '';
  }

  Future<void> _incrementStartup(String todo) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(id, todo);
    setState(() {
      identify = todo;
    });
  }

  @override
  int index = 0;
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('assignments').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          assignments = snapshot.data.documents;
          if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading...');
            default:
              return ListAssignment();
          }
        },
      )),
    );
  }
}

class ListAssignment extends StatefulWidget {
  @override
  _ListAssignmentState createState() => _ListAssignmentState();
}

class _ListAssignmentState extends State<ListAssignment> {

  @override
  Widget build(BuildContext context) {
    /*BranchSelected=getBranchName().then((branch)
      print(branch);
    );
    */

    print(BranchSelected);
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
          appBar: AppBar(
              backgroundColor: Colors.grey[900],
              title: Text(
                'Assignments',
                style: TextStyle(fontSize: 15.0),
              ),
              centerTitle: true,
              ),
          body: ListView.builder(
              itemCount: assignments.length,
              itemBuilder: (context, idx) {
                return Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          assignments[idx]['title'],
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          assignments[idx]['deadline']
                              .toDate()
                              .toString()
                              .substring(0, 10),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          assignments[idx]['branch'],
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]);
              }),
        ));
  }
}
