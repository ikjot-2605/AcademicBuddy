import 'package:academicbuddy/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
class BranchYear extends StatefulWidget {
  @override
  _BranchYearState createState() => _BranchYearState();
}

List<String> branch = [
  'CSE','CE','CVE','EEE','ECE','IT','ME','MTE','MNE'
];
List<int> year = [
  1,2,3,4
];
String BranchSelected='';
int YearSelected=0;
void pushToSP() async{
  SharedPreferences myPrefs = await SharedPreferences.getInstance();
  myPrefs.setString(id, id);
}
class _BranchYearState extends State<BranchYear> {
  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  'Select your Branch',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children: List.generate(9, (index) {
                    return Center(
                      child: FlatButton(
                        child: Text(
                          branch[index],
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            BranchSelected=branch[index];
                            print(BranchSelected);
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Year()),
                          );
                        },
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class Year extends StatefulWidget {
  @override
  _YearState createState() => _YearState();
}

class _YearState extends State<Year> {
  @override
  Widget build(BuildContext context) {
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
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  'Select your Year',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children: List.generate(4, (index) {
                    return Center(
                      child: FlatButton(
                        child: Text(
                          year[index].toString(),
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                        onPressed: (){
                          setState(() {
                            YearSelected=year[index];
                          });
                          Firestore.instance.collection('users').document(id).setData({'name':name,'email':email,'branch':BranchSelected,'year':YearSelected,'id':id});
                          pushToSP();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return FirstScreen();
                              },
                            ),
                          );
                          },
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//Firestore.instance.collection('users').document(id).setData({'name':name,'email':email});
