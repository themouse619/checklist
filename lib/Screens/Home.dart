import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text(
            "Task Sheet",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/TasksheetDash');
          },
        ),
      ),
    );
  }
}
