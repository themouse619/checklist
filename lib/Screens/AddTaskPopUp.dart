import 'package:flutter/material.dart';

class AddTaskPopUp extends StatefulWidget {
  @override
  _AddTaskPopUpState createState() => _AddTaskPopUpState();
}

class _AddTaskPopUpState extends State<AddTaskPopUp> {
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'New Task',
        style: TextStyle(fontSize: 20),
      ),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                expands: false,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    // errorBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 10, bottom: 15, top: 10, right: 15),
                    hintText: "Enter Task Description here..."),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.deepPurple, width: 2),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: DropdownButton(
                      value: dropdownValue,

                      items: <String>['URGENT', 'PENDING']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 20,
                      iconEnabledColor: Colors.deepPurple,
                      // elevation: ,
                      // isExpanded: true,
                      underline: Container(),
                      hint: Text(
                        ' Select Task Type ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    // width: MediaQuery.of(context).size.width * 0.3,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.deepPurple[300],
                      elevation: 3,
                      disabledColor: Colors.grey[300],
                      textColor: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Add Task'),
                          Icon(Icons.add),
                        ],
                      ),
                      onPressed: () {
                        // Navigator.pushNamed(context, '/TaskListScreen');
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
