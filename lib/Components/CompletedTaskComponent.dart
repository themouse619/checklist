import 'package:checklist_progressclub/json.dart';
import 'package:flutter/material.dart';

class CompletedTaskComponent extends StatefulWidget {
  @override
  _CompletedTaskComponentState createState() => _CompletedTaskComponentState();
}

class _CompletedTaskComponentState extends State<CompletedTaskComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'PROGRESS CLUB',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Center(
                child: Text(
                  '${Utils.completedData['data'].length} COMPLETED TASKS',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ),
              Center(
                child: Text(
                  '28 Jan, 2021',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
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
                    'TASKS',
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
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              // scrollDirection: Axis.vertical,
              // shrinkWrap: true,
              itemCount: Utils.completedData['data'].length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      Utils.completedData['data'][index]['id'],
                      textAlign: TextAlign.justify,
                    ),
                    dense: true,
                    trailing: Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                    // onTap: () {},
                    onLongPress: () {
                      print('Tile ${index + 1} tapped for long time');
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
