import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

int touchedIndex;

class Chart extends StatelessWidget {
  Chart({this.recovered,this.active,this.deaths});
  final double recovered;
  final double active;
  final double deaths;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: List.generate(3, (i) {
          final isTouched = i == touchedIndex;
          final double fontSize = isTouched ? 25 : 16;
          final double radius = isTouched ? 60 : 50;
          switch (i) {
            case 0:
              return PieChartSectionData(
                color: const Color(0xff13d38e),
                value: recovered.toDouble(),
                title: 'Recovered',
                radius: 40.0,
                titleStyle: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff)),
                showTitle: false,
              );
            case 1:
              return PieChartSectionData(
                  color: const Color(0xffff1a1a),
                  value: deaths.toDouble(),
                  title: 'Deceased',
                  radius: 40.0,
                  titleStyle: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffffffff)),
                  showTitle: false);
            case 2:
              return PieChartSectionData(
                  color: const Color(0xff0293ee),
                  value: active.toDouble(),
                  title: 'Active',
                  radius: 40.0,
                  titleStyle: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xffffffff)),
                  showTitle: false);
            default:
              return null;
          }
        }),
        borderData: FlBorderData(
          show: false,
        ),
        centerSpaceRadius: 45.0,
        sectionsSpace: 2.0,
      ),
    );
  }
}




