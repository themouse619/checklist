import 'package:checklist_progressclub/Screens/AddTaskPopUp.dart';
import 'package:checklist_progressclub/Screens/TaskLongPressPopUp.dart';
import 'package:checklist_progressclub/json.dart';
import 'package:flutter/material.dart';

class RemainingTaskComponent extends StatefulWidget {
  @override
  _RemainingTaskComponentState createState() => _RemainingTaskComponentState();
}

class _RemainingTaskComponentState extends State<RemainingTaskComponent> {
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
                  '${Utils.data['data'].length} REMAINING TASKS',
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
              itemCount: Utils.data['data'].length,
              itemBuilder: (context, index) {
                List a = [], b = [], c;
                for (int i = 0; i < Utils.data['data'].length; i++) {
                  if (Utils.data['data'][i]['type'] == 1) {
                    a.add(Utils.data['data'][i]);
                  } else {
                    b.add(Utils.data['data'][i]);
                  }
                }
                c = a + b;
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      c[index]['id'],
                      textAlign: TextAlign.justify,
                    ),
                    dense: true,
                    trailing: c[index]['type'] == 0
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 80,
                                // margin: EdgeInsetsDirectional.only(end: 10),
                                decoration: BoxDecoration(
                                  color: Colors.yellow[400],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Text(
                                      'PENDING',
                                      style: TextStyle(
                                          color: Color.fromRGBO(189, 186, 0, 1),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 80,
                                // margin: EdgeInsetsDirectional.only(end: 10),
                                decoration: BoxDecoration(
                                  color: Colors.red[100],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Text(
                                      'URGENT',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    // onTap: () {},
                    onLongPress: () {
                      print('Tile ${index + 1} tapped for long time');
                      showDialog(context: context,builder: (BuildContext context){
                        return TaskLongPressPopUp();
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(context: context,builder: (BuildContext context){
            return AddTaskPopUp();
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
