// ignore_for_file: prefer_const_constructors
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  bool showCalendar = true;
  void openCalendar() {
    setState(() {
      showCalendar = false;
    });
  }

  void closeCalendar() {
    setState(() {
      showCalendar = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      InkWell(
        onTap: openCalendar,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color.fromARGB(80, 255, 255, 255)),
                    left: BorderSide(color: Color.fromARGB(80, 255, 255, 255)),
                    right: BorderSide(color: Color.fromARGB(80, 255, 255, 255)),
                    bottom:
                        BorderSide(color: Color.fromARGB(80, 255, 255, 255)),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(7, 10, 10, 10),
                      child: Icon(Icons.calendar_month_rounded),
                    ),
                    Text(
                      "Today",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Offstage(
        offstage: showCalendar,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            viewSpacing: 20,
            headerStyle:
                DateRangePickerHeaderStyle(textAlign: TextAlign.center),
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              closeCalendar();
            },
          ),
        ),
      ),
      // Text(showCalendar),
    ]);
  }
}
