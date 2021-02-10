import 'package:checklist_progressclub/json.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String formatted;

  @override
  void initState() {
    formatted = formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    print(formatted);
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(Utils.Reminders['data'][0]['date']),
            subtitle: Text(Utils.Reminders['data'][0]['message']),
            trailing: Icon(Icons.notifications),
            dense: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
