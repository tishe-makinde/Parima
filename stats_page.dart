// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:parima/components/calories_chart.dart';
import 'package:parima/components/weight_chart.dart';
import 'package:parima/components/macros.dart';
import 'package:parima/components/stats_icons.dart';

class StatsPage extends StatefulWidget {
  @override
  StatsPageState createState() => StatsPageState();
}

class StatsPageState extends State<StatsPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    WeightChart(),
    ProteinChart(),
    CaloriesChart(
      items: ['Mon', 'Tue' 'Wed', 'Thurs', "Fri", 'Sat'],
    ),
  ];

  List<String> monthlyItems = ['Jan', 'Feb' 'Mar', 'Apr', "May", 'Jun'];
  List<String> weeklyItems = ['1', '2' '3', '4', "5", '6'];
  List<String> yearlyItems = ['2017', '2018' '2019', '2020', "2021", '2022'];

  void updateList(String option) {
    setState(() {
      switch (option) {
        case 'Option 1':
          _widgetOptions = [
            WeightChart(),
            ProteinChart(),
            CaloriesChart(items: weeklyItems),
          ];
          break;
        case 'Option 2':
          _widgetOptions = [
            WeightChart(),
            ProteinChart(),
            CaloriesChart(items: monthlyItems),
          ];
          break;
        case 'Option 3':
          _widgetOptions = [
            WeightChart(),
            ProteinChart(),
            CaloriesChart(items: yearlyItems),
          ];
          break;
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Weight'),
                Tab(text: 'Macros'),
                Tab(text: 'Calories'),
              ],
              onTap: _onItemTapped,
            ),
            backgroundColor: Colors.transparent),
        body: ListView(children: [
          Column(
            children: [
              _widgetOptions.elementAt(_selectedIndex),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
                child: SizedBox(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mass"),
                          Row(
                            children: [
                              Text("7 Days"),
                              PopupMenuButton<String>(
                                onSelected: (String value) {
                                  // Handle menu item selection
                                  final myStatsPageState =
                                      context.findAncestorStateOfType<
                                          StatsPageState>();
                                  myStatsPageState?.updateList(value);
                                },
                                itemBuilder: (BuildContext context) {
                                  return <PopupMenuEntry<String>>[
                                    PopupMenuItem<String>(
                                      value: 'Option 1',
                                      child: Text('Weekly Avg'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Option 2',
                                      child: Text('Monthly Avg'),
                                    ),
                                    PopupMenuItem<String>(
                                      value: 'Option 3',
                                      child: Text('Yearly Avg'),
                                    ),
                                  ];
                                },
                                icon: Icon(Icons.more_vert),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: SizedBox(
                          width: 300,
                          height: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconWithLabel(
                                icon: Icons.favorite_border_outlined,
                                value: '75g',
                                label: 'Last 7 days',
                              ),
                              IconWithLabel(
                                icon: Icons.whatshot_outlined,
                                value: '85g',
                                label: 'All Time',
                              ),
                              IconWithLabel(
                                icon: Icons.flash_on_outlined,
                                value: '90g',
                                label: 'Average',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.search),
        //       label: 'Search',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person),
        //       label: 'Profile',
        //     ),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Colors.amber[800],
        //   onTap: _onItemTapped,
        // ),
      ),
    );
  }
}
