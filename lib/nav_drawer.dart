import 'package:flutter/material.dart';
import 'assignments.dart';
import 'newAssignment.dart';
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      image: AssetImage('images/dark_nitk.png'))),
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('View Upcoming Assignments'),
              onTap: () => {
              Navigator.of(context).push(
              MaterialPageRoute(
              builder: (context) {
              return Assignment();
              },
              ),
              ),
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('View Upcoming Exams'),
              onTap: () => {
                Navigator.of(context).pop(),
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Add an event'),
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return newAssignment();
                    },
                  ),
                ),
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {
                Navigator.of(context).pop(),
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail),
              title: Text('Contact Us'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
    );
  }
}