// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MacrosChart extends StatefulWidget {
  final List<FlSpot> data;
  final String macronutrient;
  final String unit;
  const MacrosChart(
      {super.key,
      required this.data,
      required this.macronutrient,
      required this.unit});

  @override
  State<MacrosChart> createState() => _MacrosChartState();
}

class _MacrosChartState extends State<MacrosChart> {
  FlSpot? _touchedSpot;
  String _extraInfo = '';
  String thisUnit = "";

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
                thisUnit,
                style: TextStyle(color: Color.fromRGBO(163, 181, 134, 1)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(
            widget.macronutrient,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
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
                        spots: widget.data,
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
                            thisUnit = widget.unit;
                          });
                        } else {
                          setState(() {
                            _touchedSpot = null;
                            _extraInfo = '';
                            thisUnit = "";
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

// Column(
//       children: [
//         SizedBox(
//           height: 90,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   _extraInfo,
//                   style: Theme.of(context).textTheme.displaySmall,
//                 ),
//               ),
//               Text(
//                 unit,
//                 style: TextStyle(color: Color.fromRGBO(163, 181, 134, 1)),
//               ),
//             ],
//           ),
//         ),
        