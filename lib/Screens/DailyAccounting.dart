import 'package:flutter/material.dart';
import 'package:checklist_progressclub/json.dart';

class DailyAccounting extends StatefulWidget {
  @override
  _DailyAccountingState createState() => _DailyAccountingState();
}

class _DailyAccountingState extends State<DailyAccounting> {
  bool isLoading;
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    addControllers();
    isLoading = false;
    if (isLoading == true) {
      setControllers();
    }
  }

  addControllers() {
    for (int i = 0; i < Utils.accountingTitles['data'].length; i++) {
      controllers.add(new TextEditingController());
    }
  }

  setControllers() {
    for (int i = 0; i < controllers.length; i++) {
      controllers[i].text = Utils.accountingTitles['data'][i]['value'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Daily Accounting'),
        ),
        body: isLoading == false
            ? Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: Utils.accountingTitles['data'].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 3.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            controller: controllers[index],
                            style: TextStyle(color: Colors.deepPurple),
                            decoration: InputDecoration(
                              labelText: Utils.accountingTitles['data'][index]
                                  ['title'],
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 10, bottom: 15, top: 10, right: 15),
                            ),
                            keyboardType: index == 7
                                ? TextInputType.text
                                : TextInputType.number,
                          ),
                        );
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.deepPurple[300],
                      elevation: 3,
                      disabledColor: Colors.grey[300],
                      textColor: Colors.white,
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 16),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            : Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: Utils.accountingTitles['data'].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 3.0),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextFormField(
                            enabled: false,
                            controller: controllers[index],
                            style: TextStyle(color: Colors.deepPurple),
                            decoration: InputDecoration(
                              labelText: Utils.accountingTitles['data'][index]
                                  ['title'],
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 10, bottom: 15, top: 10, right: 15),
                            ),
                            // keyboardType: index == 7
                            //     ? TextInputType.text
                            //     : TextInputType.number,
                          ),
                        );
                      }),
                ],
              ));
  }
}
