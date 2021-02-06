import 'package:flutter/material.dart';

class AddReminderPopUp extends StatefulWidget {
  @override
  _AddReminderPopUpState createState() => _AddReminderPopUpState();
}

class _AddReminderPopUpState extends State<AddReminderPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Reminder'),
      content: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 2,
                expands: false,
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    // focusedBorder: InputBorder.none,
                    // enabledBorder: InputBorder.none,
                    // errorBorder: InputBorder.none,
                    // disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 10, bottom: 10, top: 10, right: 15),
                    hintText: "Enter Reminder Description here..."),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.deepPurple, width: 2),
              ),
            ),
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
                          Text('Add Reminder'),
                          Icon(Icons.add),
                        ],
                      ),
                      onPressed: () {},
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
