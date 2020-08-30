import 'package:flutter/material.dart';
import 'package:flag/flag.dart';

class CasesCards extends StatelessWidget {
  CasesCards(
      {@required this.text,
      @required this.color,
      @required this.boxTitle,
      this.delText});
  final Color color;
  final String text;
  final String boxTitle;
  final String delText;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150.0,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4.0, // soften the shadow
                spreadRadius: 1.0, //extend the shadow
                offset: Offset.fromDirection(2.0),
              ),
            ]
            //border: Border.all(Color(0xFFFDFDFD))
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '+ $delText',
              style: TextStyle(
                fontSize: 15.0,
                color: color,
                fontFamily: 'Ubuntu',
              ),
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: color,
                fontFamily: 'Ubuntu',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              boxTitle,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarContent extends StatelessWidget {
  AppBarContent({this.title, this.icon});
  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.blue.shade900,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}

class StatesCards extends StatelessWidget {
  StatesCards(
      {@required this.state, @required this.infected, @required this.deceased});
  final String state;
  final String infected;
  final String deceased;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.only(top: 10.0),
          margin:
              EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),
          height: 220.0,
          width: 150.0,
          decoration: BoxDecoration(
              color: Color(0x59dbdbdb),
              borderRadius: BorderRadius.circular(20.0)),
          child: Column(
            children: [
              Expanded(
                child: Text(
                  state,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Ubuntu',
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 177.0,
                width: 155.0,
                decoration: BoxDecoration(
                  color: Color(0xa6dbc6eb),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Infected',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.green,
                          fontFamily: 'Ubuntu',
                        )),
                    Text(
                      infected,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text('Deceased',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.red,
                          fontFamily: 'Ubuntu',
                        )),
                    Text(
                      deceased,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontFamily: 'Ubuntu',
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

class MoreStats extends StatelessWidget {
  MoreStats({this.tests, this.cases, this.deaths});
  final String tests;
  final String deaths;
  final String cases;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(5.0),
            height: 60.0,
            margin: EdgeInsets.only(top: 15.0, bottom: 10.0),
            decoration: BoxDecoration(
                color: Color(0xBFdbdbdb),
                borderRadius: BorderRadius.circular(15.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Samples Tested',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                SizedBox(
                  width: 120.0,
                ),
                Text(
                  tests,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu'),
                )
              ],
            )),
        Container(
          padding: EdgeInsets.all(5.0),
          height: 70,
          margin: EdgeInsets.only(top: 10.0, bottom: 30.0),
          decoration: BoxDecoration(
              color: Color(0x73ff847c),
              borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Per Million Cases',
                style: TextStyle(fontSize: 18.0, fontFamily: 'Ubuntu'),
              ),
              SizedBox(
                width: 80.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cases',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  Text(
                    cases,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                        color: Colors.redAccent),
                  ),
                ],
              ),
              SizedBox(
                width: 30.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Deaths',
                    style: TextStyle(fontSize: 15.0, fontFamily: 'Ubuntu'),
                  ),
                  Text(
                    deaths,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                        color: Colors.red),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PieChartVisualiser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              color: Colors.greenAccent,
              margin: EdgeInsets.only(left: 25.0, bottom: 5.0, right: 10.0),
            ),
            Text('Recovered')
          ],
        ),
        Row(
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              color: Colors.blue,
              margin: EdgeInsets.only(left: 25.0, bottom: 5.0, right: 10.0),
            ),
            Text('Active')
          ],
        ),
        Row(
          children: [
            Container(
              height: 20.0,
              width: 20.0,
              color: Colors.red,
              margin: EdgeInsets.only(left: 25.0, bottom: 5.0, right: 10.0),
            ),
            Text('Deceased')
          ],
        )
      ],
    );
  }
}

class FlaggedAppBar extends StatelessWidget {
  FlaggedAppBar({this.country, this.countryFlag});
  final String country;
  final String countryFlag;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.blue.shade900,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flag(countryFlag, height: 30.0, width: 30.0),
              SizedBox(
                width: 20.0,
              ),
              Text(
                country,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}

class SymptomsCard extends StatelessWidget {
  SymptomsCard({this.image, this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 150.0,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        margin: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Image.asset('images/$image.png', height: 110),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PreventionCards extends StatelessWidget {
  PreventionCards({this.title, this.image, this.text});
  final String text;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.0, right: 5.0, top: 15.0),
      margin: EdgeInsets.all(8.0),
      height: 140.0,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(children: [
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                text,
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                ),
              )
            ]),
          ),
          Expanded(
            child: Image.asset('images/$image.png'),
          ),
        ],
      ),
    );
  }
}


class CountryAppBar extends StatelessWidget {
  CountryAppBar({this.country, this.countryFlag});
  final String country;
  final String countryFlag;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Colors.blue.shade900,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(countryFlag,scale: 8.0),
              SizedBox(
                width: 20.0,
              ),
              Text(
                country,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}
