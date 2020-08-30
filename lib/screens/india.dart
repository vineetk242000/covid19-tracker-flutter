import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:covid_19/components/reusable_widgets.dart';
import 'package:covid_19/components/pieChart_data.dart';
import 'package:covid_19/constants.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {

  String confirmed = '2456786',
      recovered = '1489567',
      active = '315765',
      deceased = '57643',casesToday='40208',deathsToday='540',recoveredToday='30630',
      tested='34567345',pmDeaths='2334',pmCases='40';

  int activeData=33;
  int recoveredData=33;
  int deathsData= 33;

  String updatedOn;
  Map<String, dynamic> result;
  Map<String,dynamic> stateData;
  DateTime dateTime;
  int timestamp;

  String convertToMillions(number){
    return number.replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  Future getIndiaData() async {
    final response= await http.get('https://disease.sh/v3/covid-19/countries/India');
    result = jsonDecode(response.body);
    confirmed = result['cases'].toString();
    recovered = result['recovered'].toString();
    active = result['active'].toString();
    deceased = result['deaths'].toString();
    casesToday=result['todayCases'].toString();
    deathsToday=result['todayDeaths'].toString();
    recoveredToday=result['todayRecovered'].toString();
    tested=result['tests'].toString();
    pmCases=result['casesPerOneMillion'].toString();
    pmDeaths=result['deathsPerOneMillion'].toString();
    recoveredData = result['recovered'];
    activeData = result['active'];
    deathsData = result['deaths'];

    timestamp = result['updated'];

    dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    setState(() {
      updatedOn = (DateFormat('dd MMM yyyy, hh:mm a').format(dateTime));
    });
  }

  Future getStatesData()async{
    final response = await http.get('https://api.covid19india.org/data.json');
    stateData=jsonDecode(response.body);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    totalCasesIndia=getIndiaData();
    stats=getStatesData();
  }
  Future totalCasesIndia;
  Future stats;

  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: FlaggedAppBar(country: 'INDIA',countryFlag: 'in'),
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              height: 250.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: totalCasesIndia,
                    builder: (context, snapshot) {
                      return Expanded(
                        child: Container(
                          child: Chart(recovered: recoveredData.toDouble(),deaths: deathsData.toDouble(),active: activeData.toDouble()),
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: PieChartVisualiser(),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  'Cases Updates',
                  style:kSectionHeader
                ),
                Text('Last Update: $updatedOn',style: TextStyle(color: Colors.black54))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 20.0, left: 8.0, right: 8.0, bottom: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: totalCasesIndia,
                    builder: (context, snapshot) {
                      if (totalCasesIndia == null) {
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
                                    delText: convertToMillions(recoveredToday)
                                )
                              ],
                            ),
                            Row(
                              children: [
                                CasesCards(
                                    text: convertToMillions(deceased),
                                    color: Colors.red,
                                    boxTitle: 'Deceased',
                                    delText: convertToMillions(deathsToday),
                                ),
                                CasesCards(
                                    text: convertToMillions(active),
                                    color: Colors.blueAccent,
                                    boxTitle: 'Active',
                                    delText: '0',
                                )
                              ],
                            ),
                            MoreStats(tests: convertToMillions(tested),cases: convertToMillions(pmCases),deaths: convertToMillions(pmDeaths))
                          ]);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0,right: 5.0),
                    child: Row(
                      children: [
                        Text(
                          'Most Affected States',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,fontFamily: 'Ubuntu'
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, 'states',arguments: stateData);
                            },
                            child: Text(
                              'View More',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  fontFamily: 'Ubuntu',
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  FutureBuilder(
                    future: stats,
                    builder: (context, snapshot) {
                      if (totalCasesIndia == null) {
                        return CircularProgressIndicator();
                      }

                      return  Row(
                        children: [
                          StatesCards(
                              state: stateData==null? 'State':stateData['statewise'][1]['state'],
                              infected: stateData==null? 'State':stateData['statewise'][1]['confirmed'],
                              deceased: stateData==null? 'State':stateData['statewise'][1]['deaths']),
                          StatesCards(
                              state:stateData==null? 'State':stateData['statewise'][2]['state'],
                              infected: stateData==null? 'State':stateData['statewise'][2]['confirmed'],
                              deceased: stateData==null? 'State':stateData['statewise'][2]['deaths']),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
