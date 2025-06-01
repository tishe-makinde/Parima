// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightChart extends StatefulWidget {
  const WeightChart({super.key});
  @override
  WeightChartState createState() => WeightChartState();
}

class WeightChartState extends State<WeightChart> {
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
            padding: const EdgeInsets.fromLTRB(20, 2, 20, 5),
            child: Stack(
              children: [
                LineChart(
                  LineChartData(
                    borderData: FlBorderData(
                      show: false, // Set show to false to remove border
                    ),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    minX: 0,
                    maxX: 6,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 3),
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
                            unit = "Kg";
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
