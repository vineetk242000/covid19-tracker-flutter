import 'package:flutter/material.dart';
import 'package:covid_19/components/reusable_widgets.dart';
import 'package:covid_19/constants.dart';
import 'package:intl/intl.dart';
import 'package:covid_19/components/pieChart_data.dart';

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  int touchedIndex;
  Map<String, dynamic> result;
  String updatedOn;
  DateTime dateTime;

  String convertToMillions(number) {
    return number.replaceAllMapped(
        new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) result = arguments;
    dateTime = DateTime.fromMillisecondsSinceEpoch(result['updated']);
    updatedOn = (DateFormat('dd MMM yyyy, hh:mm a').format(dateTime));

    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: CountryAppBar(
            country: result['country'].toString(),
            countryFlag: result['countryInfo']['flag'].toString()),
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
                  Expanded(
                    child: Container(
                      child: Chart(
                        recovered: result['recovered'].toDouble(),
                        deaths: result['deaths'].toDouble(),
                        active: result['active'].toDouble(),
                      ),
                    ),
                  ),
                  Expanded(
                    child: PieChartVisualiser(),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text('Cases Updates', style: kSectionHeader),
                Text('Last Updates: $updatedOn')
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 20.0, left: 8.0, right: 8.0, bottom: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        CasesCards(
                          text: convertToMillions(result['cases'].toString()),
                          color: Color(0xFFF2D313),
                          boxTitle: 'Confirmed',
                          delText: convertToMillions(
                              result['todayCases'].toString()),
                        ),
                        CasesCards(
                          text:
                              convertToMillions(result['recovered'].toString()),
                          color: Colors.green,
                          boxTitle: 'Recovered',
                          delText: convertToMillions(
                              result['todayRecovered'].toString()),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        CasesCards(
                          text: convertToMillions(result['deaths'].toString()),
                          color: Colors.red,
                          boxTitle: 'Deceased',
                          delText: convertToMillions(
                              result['todayDeaths'].toString()),
                        ),
                        CasesCards(
                          text: convertToMillions(result['active'].toString()),
                          color: Colors.blueAccent,
                          boxTitle: 'Active',
                          delText: '0',
                        )
                      ],
                    ),
                    MoreStats(
                        tests: convertToMillions(result['tests'].toString()),
                        cases: convertToMillions(
                            result['casesPerOneMillion'].toString()),
                        deaths: convertToMillions(
                            result['deathsPerOneMillion'].toString()))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
