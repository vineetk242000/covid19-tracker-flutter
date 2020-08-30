import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage(
                'images/me.jpg',
              ),
            ),
            Text(
              'Vineet Kumar',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0),
            ),
            Text(
              'LEARNER',
              style: TextStyle(
                  color: Colors.cyan[100], fontSize: 20.0, letterSpacing: 2.5),
            ),
            SizedBox(
              height: 20.0,
              width: 160.0,
              child: Divider(
                color: Colors.cyan[100],
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.cyan[900]),
                title: Text(
                  '+91 9102661057',
                  style: TextStyle(color: Colors.cyan[900], fontSize: 18.0),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.cyan[900]),
                title: Text(
                  'vineetkumar242000@gmail.com',
                  style: TextStyle(
                      color: Colors.cyan[900],
                      fontSize: 18.0,
                      fontFamily: 'Sans'),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(Icons.work, color: Colors.cyan[900]),
                title: Text(
                  'BCET',
                  style: TextStyle(
                    color: Colors.cyan[900],
                    fontSize: 18.0,
                  ),
                ),
              ),
            )
          ])),
    );
  }
}
