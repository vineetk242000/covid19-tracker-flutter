import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/components/reusable_widgets.dart';
import 'package:covid_19/constants.dart';

class States extends StatefulWidget {
  @override
  _StatesState createState() => _StatesState();
}

class _StatesState extends State<States> {
  Map<String, dynamic> stateData;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null) stateData = arguments;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: AppBarContent(title: 'Indian States Data'),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][1]['state'],
                        infected: stateData['statewise'][1]['confirmed'],
                        deceased: stateData['statewise'][1]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][2]['state'],
                        infected: stateData['statewise'][2]['confirmed'],
                        deceased: stateData['statewise'][2]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][3]['state'],
                        infected: stateData['statewise'][3]['confirmed'],
                        deceased: stateData['statewise'][3]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][4]['state'],
                        infected: stateData['statewise'][4]['confirmed'],
                        deceased: stateData['statewise'][4]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][5]['state'],
                        infected: stateData['statewise'][5]['confirmed'],
                        deceased: stateData['statewise'][5]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][6]['state'],
                        infected: stateData['statewise'][6]['confirmed'],
                        deceased: stateData['statewise'][6]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][7]['state'],
                        infected: stateData['statewise'][7]['confirmed'],
                        deceased: stateData['statewise'][7]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][8]['state'],
                        infected: stateData['statewise'][8]['confirmed'],
                        deceased: stateData['statewise'][8]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][9]['state'],
                        infected: stateData['statewise'][9]['confirmed'],
                        deceased: stateData['statewise'][9]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][10]['state'],
                        infected: stateData['statewise'][10]['confirmed'],
                        deceased: stateData['statewise'][10]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][11]['state'],
                        infected: stateData['statewise'][11]['confirmed'],
                        deceased: stateData['statewise'][11]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][12]['state'],
                        infected: stateData['statewise'][12]['confirmed'],
                        deceased: stateData['statewise'][12]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][13]['state'],
                        infected: stateData['statewise'][13]['confirmed'],
                        deceased: stateData['statewise'][13]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][14]['state'],
                        infected: stateData['statewise'][14]['confirmed'],
                        deceased: stateData['statewise'][14]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][15]['state'],
                        infected: stateData['statewise'][15]['confirmed'],
                        deceased: stateData['statewise'][15]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][16]['state'],
                        infected: stateData['statewise'][16]['confirmed'],
                        deceased: stateData['statewise'][16]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][17]['state'],
                        infected: stateData['statewise'][17]['confirmed'],
                        deceased: stateData['statewise'][17]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][18]['state'],
                        infected: stateData['statewise'][18]['confirmed'],
                        deceased: stateData['statewise'][18]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][19]['state'],
                        infected: stateData['statewise'][19]['confirmed'],
                        deceased: stateData['statewise'][19]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][20]['state'],
                        infected: stateData['statewise'][20]['confirmed'],
                        deceased: stateData['statewise'][20]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][21]['state'],
                        infected: stateData['statewise'][21]['confirmed'],
                        deceased: stateData['statewise'][21]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][22]['state'],
                        infected: stateData['statewise'][22]['confirmed'],
                        deceased: stateData['statewise'][22]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][23]['state'],
                        infected: stateData['statewise'][23]['confirmed'],
                        deceased: stateData['statewise'][23]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][24]['state'],
                        infected: stateData['statewise'][24]['confirmed'],
                        deceased: stateData['statewise'][24]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][25]['state'],
                        infected: stateData['statewise'][25]['confirmed'],
                        deceased: stateData['statewise'][25]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][26]['state'],
                        infected: stateData['statewise'][26]['confirmed'],
                        deceased: stateData['statewise'][26]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][27]['state'],
                        infected: stateData['statewise'][27]['confirmed'],
                        deceased: stateData['statewise'][27]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][28]['state'],
                        infected: stateData['statewise'][28]['confirmed'],
                        deceased: stateData['statewise'][28]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][29]['state'],
                        infected: stateData['statewise'][29]['confirmed'],
                        deceased: stateData['statewise'][29]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][30]['state'],
                        infected: stateData['statewise'][30]['confirmed'],
                        deceased: stateData['statewise'][30]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][31]['state'],
                        infected: stateData['statewise'][31]['confirmed'],
                        deceased: stateData['statewise'][31]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][32]['state'].toString(),
                        infected: stateData['statewise'][32]['confirmed'],
                        deceased: stateData['statewise'][32]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][33]['state'],
                        infected: stateData['statewise'][33]['confirmed'],
                        deceased: stateData['statewise'][33]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][34]['state'],
                        infected: stateData['statewise'][34]['confirmed'],
                        deceased: stateData['statewise'][34]['deaths']),
                  ],
                ),
                Row(
                  children: [
                    StatesCards(
                        state: stateData['statewise'][35]['state'],
                        infected: stateData['statewise'][35]['confirmed'],
                        deceased: stateData['statewise'][35]['deaths']),
                    StatesCards(
                        state: stateData['statewise'][37]['state'],
                        infected: stateData['statewise'][37]['confirmed'],
                        deceased: stateData['statewise'][37]['deaths']),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
