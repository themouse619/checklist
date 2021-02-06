import 'package:checklist_progressclub/Components/CompletedTaskComponent.dart';
import 'package:checklist_progressclub/Components/RemainingTaskComponent.dart';
import 'package:flutter/material.dart';

class TaskListScreen extends StatefulWidget {
  int tabIndex;
  TaskListScreen({this.tabIndex});
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen>  with SingleTickerProviderStateMixin {
   final List<Tab> myTabs = <Tab>[
    Tab(child:Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text('REMAINING'),
    ),),
    Tab(child:Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text('COMPLETED'),
    ),),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length,initialIndex: widget.tabIndex==1?1:0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Tasks'),
          bottom: TabBar(
            controller: _tabController,
            tabs: myTabs,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            RemainingTaskComponent(),
            CompletedTaskComponent(),
          ],
        ));
  }
}
