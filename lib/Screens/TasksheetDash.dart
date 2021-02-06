import 'package:checklist_progressclub/Screens/AddReminderPopUp.dart';
import 'package:checklist_progressclub/Screens/TaskListScreen.dart';
import 'package:checklist_progressclub/json.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class TasksheetDash extends StatefulWidget {
  @override
  _TasksheetDashState createState() => _TasksheetDashState();
}

class _TasksheetDashState extends State<TasksheetDash> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Sheet'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 100,
              color: Colors.deepPurple,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Card(
              // semanticContainer: true,
              margin: EdgeInsets.all(15),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: CalendarCarousel(
                  thisMonthDayBorderColor: Colors.grey,
                  // showHeader: false,
                  daysHaveCircularBorder: true,
                  showHeaderButton: true,
                  headerTextStyle: TextStyle(color: Colors.red, fontSize: 20),
                  iconColor: Colors.red,
                  todayButtonColor: Colors.red.withOpacity(0.3),
                  todayBorderColor: Colors.transparent,
                  weekendTextStyle: TextStyle(color: Colors.red),
                  weekdayTextStyle: TextStyle(color: Colors.red),
                  selectedDayButtonColor: Colors.deepPurple,
                  selectedDayBorderColor: Colors.transparent,
                  selectedDateTime: selectedDate,
                  onDayPressed: (date, list) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                  onDayLongPressed: (date) {
                    print('${date} pressed');
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddReminderPopUp();
                        });
                  },
//      weekDays: null, /// for pass null when you do not want to render weekDays
//      headerText: Container( /// Example for rendering custom header
//        child: Text('Custom Header'),
//      ),
                  customDayBuilder: (
                    /// you can provide your own build function to make custom day containers
                    bool isSelectable,
                    int index,
                    bool isSelectedDay,
                    bool isToday,
                    bool isPrevMonthDay,
                    TextStyle textStyle,
                    bool isNextMonthDay,
                    bool isThisMonthDay,
                    DateTime day,
                  ) {
                    /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                    /// This way you can build custom containers for specific days only, leaving rest as default.

                    // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                    if (day.day == 15) {
                      return Center(
                        child: Icon(Icons.local_airport),
                      );
                    } else {
                      return null;
                    }
                  },

                  /// null for not rendering any border, true for circular border, false for rectangular border
                ),
              ),
            ),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'PROGRESS CLUB',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 10,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${(Utils.data['data'].length) + (Utils.completedData['data'].length)} TASKS', // completed+remaining tasks
                    style: TextStyle(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 10,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ListTile(
                      title: Center(
                        child: Text(
                          '${Utils.completedData['data'].length}',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.green,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          'Completed',
                          style: TextStyle(color: Colors.lightGreen),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TaskListScreen(tabIndex: 1)));
                      },
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      enabled: false,
                      title: Center(
                        child: Text(
                          '${Utils.data['data'].length}',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.red,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          'Not Completed',
                          style: TextStyle(color: Colors.red[300]),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Container(
                height: 100,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height *
                            0.09, // width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.deepPurple[300],
                          elevation: 3,
                          disabledColor: Colors.grey[300],
                          textColor: Colors.white,
                          child: Text('MY TASKS'),
                          onPressed: () {
                            Navigator.pushNamed(context, '/TaskListScreen');
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.09,
                        // width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.deepPurple[300],
                          elevation: 3,
                          child: Text('DAILY ACCOUNTING'),
                          disabledColor: Colors.grey[300],
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.pushNamed(context, '/DailyAccounting');
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
