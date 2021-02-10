import 'package:checklist_progressclub/Screens/AddReminderPopUp.dart';
import 'package:checklist_progressclub/Screens/TaskListScreen.dart';
import 'package:checklist_progressclub/json.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';

class TasksheetDash extends StatefulWidget {
  @override
  _TasksheetDashState createState() => _TasksheetDashState();
}

class _TasksheetDashState extends State<TasksheetDash> {
  DateTime selectedDate = DateTime.now();
  bool isLoading = false;
  List eventDates = [
    // DateTime(2021, 2, 17),
    // DateTime(2021, 2, 21),
    // DateTime(2021, 2, 26),
    // DateTime(2021, 2, 26),
    // DateTime(2021, 3, 01),
  ];
  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  addEventDates() {
    for (int i = 0; i < Utils.Reminders['data'].length; i++) {
      eventDates.add(DateTime.parse(Utils.Reminders['data'][i]['date']));
    }
  }

  addMarkedEvents() {
    addEventDates();
    for (int i = 0; i < eventDates.length; i++) {
      _markedDateMap.add(
        eventDates[i],
        new Event(
          date: eventDates[i],
          // title: 'Reminder',
          // icon: Icon(
          //   Icons.circle,
          //   size: 5,
          //   color: Colors.blue,
          // ),
        ),
      );
    }
  }

  @override
  void initState() {
    addMarkedEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Sheet'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Container(
              height: 25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/reminder.png'))),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/Reminders');
            },
          )
        ],
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
                  selectedDayButtonColor: Colors.redAccent,
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
                  markedDatesMap: _markedDateMap,
                  markedDateCustomShapeBorder: CircleBorder(
                    side: BorderSide(
                      color: Colors.cyan,
                      width: 2.0,
                    ),
                  ),
                  markedDateWidget: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.cyan,
                    ),
                  ),
                  markedDateShowIcon: false,
                  // markedDateIconBuilder: (event) {
                  //   return event.icon;
                  // },
                  // customDayBuilder: (
                  //   /// you can provide your own build function to make custom day containers
                  //   bool isSelectable,
                  //   int index,
                  //   bool isSelectedDay,
                  //   bool isToday,
                  //   bool isPrevMonthDay,
                  //   TextStyle textStyle,
                  //   bool isNextMonthDay,
                  //   bool isThisMonthDay,
                  //   DateTime day,
                  // ) {
                  //   /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
                  //   /// This way you can build custom containers for specific days only, leaving rest as default.
                  //
                  //   // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
                  //   if (day.day == 15) {
                  //     return Center(
                  //       child: Icon(Icons.local_airport),
                  //     );
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
              ),
            ),
          ),
          isLoading == false
              ? Column(
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
                          '${(Utils.data['data'].length) + (Utils.completedData['data'].length)} TASKS',
                          // completed+remaining tasks
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
                                  Navigator.pushNamed(
                                      context, '/TaskListScreen');
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
                                  Navigator.pushNamed(
                                      context, '/DailyAccounting');
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
                )
              : Column(
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
                          'NO TASKS ADDED', // No tasks added
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
                                '0',
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
                                '0',
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
                                  Navigator.pushNamed(
                                      context, '/TaskListScreen');
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
                                  Navigator.pushNamed(
                                      context, '/DailyAccounting');
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
