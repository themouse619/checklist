import 'package:flutter/material.dart';

class TaskLongPressPopUp extends StatefulWidget {
  @override
  _TaskLongPressPopUpState createState() => _TaskLongPressPopUpState();
}

class _TaskLongPressPopUpState extends State<TaskLongPressPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        'Actions on this Task',
        style: TextStyle(fontSize: 20),
      )),
      content: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Discard this Task\n(or)\nMark this task as "Completed"',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(onPressed: (){},child: Text('DISCARD'),),
              SizedBox(width: 50,),
              TextButton(onPressed: (){},child: Text('COMPLETE'),),
            ],
          ),
        ],
      ),
    );
  }
}
