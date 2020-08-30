import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid_19/components/reusable_widgets.dart';
import 'package:covid_19/constants.dart';
import 'package:covid_19/countries_list.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String confirmed = '23456786',
      recovered = '16789567',
      active = '6545765',
      deceased = '867890',
      casesToday = '10007',
      deathsToday = '1960',
      recoveredToday = '75630';
  String updatedOn;
  Map<String, dynamic> result;
  String dropdownValue = 'Afghanistan';
  DateTime dateTime;
  int timestamp;

  String convertToMillions(number) {
    return number.replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  Future getCountryData(country) async {
    var response =
        await http.get('https://disease.sh/v3/covid-19/countries/$country');
    return (jsonDecode(response.body));
  }

  Future getWorldData() async {
    try {
      var response = await http.get('https://disease.sh/v3/covid-19/all');
      result = jsonDecode(response.body);
      confirmed = result['cases'].toString();
      recovered = result['recovered'].toString();
      active = result['active'].toString();
      deceased = result['deaths'].toString();
      casesToday = result['todayCases'].toString();
      deathsToday = result['todayDeaths'].toString();
      recoveredToday = result['todayRecovered'].toString();
      timestamp = result['updated'];

      dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

      setState(() {
        updatedOn = (DateFormat('dd MMM yyyy, hh:mm a').format(dateTime));
      });
    }
    catch(e){
      return Text("Error getting Data",style: TextStyle(fontSize: 20.0,color: Colors.red),);
    }
  }

  Future totalCasesFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalCasesFuture = getWorldData();
  }


  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: AppBarContent(title: 'Covid-19 Tracker'),
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              child: Image.asset('images/home.gif',
                  height: 250.0, width: double.infinity),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0,right: 40.0),
              child: Container(
                width: 300.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.blue, spreadRadius: 2)]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.red),
                    new DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.blue,
                      ),
                      iconSize: 30,
                      elevation: 16,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.0,
                        fontFamily: 'Ubuntu',
                      ),
                      underline: Container(height: 0),
                      onChanged: (String newValue) async {
                        setState(() {
                          dropdownValue = newValue;
                        });

                        var countryStats = await getCountryData(dropdownValue);
                        Navigator.pushNamed(context, 'country_data',
                            arguments: countryStats);
                      },
                      items: countryList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Text(value),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                Text('Cases Updates', style: kSectionHeader),
                SizedBox(
                  height: 1.0,
                ),
                Text(
                  'Last Update: $updatedOn',
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            FutureBuilder(
              future: totalCasesFuture,
              builder: (context, snapshot) {
                if (totalCasesFuture == null) {
                  return CircularProgressIndicator();
                }

                return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          CasesCards(
                            text: convertToMillions(confirmed),
                            color: Color(0xFFF2D313),
                            boxTitle: 'Confirmed',
                            delText: convertToMillions(casesToday),
                          ),
                          CasesCards(
                            text: convertToMillions(recovered),
                            color: Colors.green,
                            boxTitle: 'Recovered',
                            delText: convertToMillions(recoveredToday),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          CasesCards(
                              text: convertToMillions(deceased),
                              color: Colors.red,
                              boxTitle: 'Deceased',
                              delText: convertToMillions(deathsToday)),
                          CasesCards(
                            text: convertToMillions(active),
                            color: Colors.blueAccent,
                            boxTitle: 'Active',
                            delText: '0',
                          )
                        ],
                      ),
                    ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
