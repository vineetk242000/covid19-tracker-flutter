import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:covid_19/screens/india.dart';
import 'package:covid_19/screens/dashboard.dart';
import 'package:covid_19/screens/info.dart';





class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex=0;

  final List<Widget> _children = [
   Dashboard(),
    India(),
    KnowMore(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: _currentIndex,
        children: _children,

      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          elevation: 5.0,
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          backgroundColor:
          Color(0xFFF8F8F8), // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.whatshot),
              title: new Text('World'),
            ),
            BottomNavigationBarItem(
              icon: Flag('IN', height: 25.0, width: 25.0),
              title: new Text('India'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.info), title: Text('About'))
          ],
        ),
      ),
    );
  }
}
