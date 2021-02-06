import 'package:checklist_progressclub/Screens/DailyAccounting.dart';
import 'package:checklist_progressclub/Screens/Home.dart';
import 'package:checklist_progressclub/Screens/TaskListScreen.dart';
import 'package:checklist_progressclub/Screens/TasksheetDash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => Home(),
        '/TasksheetDash': (BuildContext context) => TasksheetDash(),
        '/TaskListScreen': (BuildContext context) => TaskListScreen(),
        '/DailyAccounting': (BuildContext context) => DailyAccounting(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
    );
  }
}
