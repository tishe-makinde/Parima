// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CaloriesChart extends StatefulWidget {
  final List<String> items;
  const CaloriesChart({super.key, required this.items});
  @override
  CaloriesChartState createState() => CaloriesChartState();
}

class CaloriesChartState extends State<CaloriesChart> {
  FlSpot? _touchedSpot;
  String _extraInfo = '';
  String unit = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 90,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _extraInfo,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Text(
                unit,
                style: TextStyle(color: Color.fromRGBO(163, 181, 134, 1)),
              ),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1.4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 2, 20, 5),
            child: Stack(
              children: [
                LineChart(
                  LineChartData(
                    borderData: FlBorderData(
                      show: false, // Set show to false to remove border
                    ),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      // leftTitles: AxisTitles(
                      //   sideTitles: SideTitles(showTitles: false),
                      // ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 1:
                                return Text(widget.items[0]);
                              case 2:
                                return Text(widget.items[1]);
                              case 3:
                                return Text(widget.items[2]);
                              case 4:
                                return Text(widget.items[3]);
                              case 5:
                                return Text(widget.items[4]);
                              default:
                                return Text('');
                            }
                          },
                        ),
                      ),
                    ),
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(1, 1),
                          FlSpot(2, 4),
                          FlSpot(3, 2),
                          FlSpot(4, 5),
                          FlSpot(5, 3),
                          FlSpot(6, 4),
                        ],
                        isCurved: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: const [
                            Color(0xffa8e063), // Lighter shade
                            Color(0xff56ab2f), // Darker shade
                          ],
                        ),
                        barWidth: 3,
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                    lineTouchData: LineTouchData(
                      touchCallback: (LineTouchResponse, touchResponse) {
                        if (touchResponse?.lineBarSpots != null) {
                          setState(() {
                            _touchedSpot = touchResponse?.lineBarSpots![0];
                            _extraInfo = '${_touchedSpot!.y}';
                            unit = "Kcal";
                          });
                        } else {
                          setState(() {
                            _touchedSpot = null;
                            _extraInfo = '';
                            unit = "";
                          });
                        }
                      },
                      handleBuiltInTouches: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
