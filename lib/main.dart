import 'package:flutter/material.dart';
import 'package:covid_19/screens/home.dart';
import 'package:covid_19/screens/info.dart';
import 'package:covid_19/screens/india.dart';
import 'package:covid_19/screens/about.dart';
import 'package:covid_19/screens/states.dart';
import 'package:covid_19/screens/country.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        backgroundColor: Colors.white,
      ),
      home: Home(),
      routes: {
        'know_more':(context)=>KnowMore(),
        'india':(context)=>India(),
        'about':(context)=>About(),
        'states':(context)=>States(),
        'country_data':(context)=>Country()
      },


    );
  }
}
