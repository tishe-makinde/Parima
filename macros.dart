// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:parima/components/macros/macros_widget.dart';

class ProteinChart extends StatefulWidget {
  const ProteinChart({super.key});
  @override
  ProteinChartState createState() => ProteinChartState();
}

class ProteinChartState extends State<ProteinChart> {
  FlSpot? _touchedSpot;
  String _extraInfo = '';
  String unit = "";

  void handleInfoChange(String newInfo, String newUnit) {
    setState(() {
      _extraInfo = newInfo;
      unit = newUnit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        MacrosChart(
          data: [
            FlSpot(0, 2),
            FlSpot(1, 1),
            FlSpot(2, 4),
            FlSpot(3, 2),
            FlSpot(4, 5),
            FlSpot(5, 3),
            FlSpot(6, 4),
          ],
          macronutrient: "Protein",
          unit: "g",
        ),
        MacrosChart(
          data: [
            FlSpot(0, 3),
            FlSpot(1, 1),
            FlSpot(2, 4),
            FlSpot(3, 2),
            FlSpot(4, 5),
            FlSpot(5, 3),
            FlSpot(6, 4),
          ],
          macronutrient: "Carbs",
          unit: "g",
        ),
        MacrosChart(
          data: [
            FlSpot(0, 3),
            FlSpot(1, 1),
            FlSpot(2, 4),
            FlSpot(3, 2),
            FlSpot(4, 5),
            FlSpot(5, 3),
            FlSpot(6, 4),
          ],
          macronutrient: "Fats",
          unit: "g",
        )
      ],
      options: CarouselOptions(
        height: 410,
        autoPlay: true,
        viewportFraction: 1,
      ),
    );
  }
}
