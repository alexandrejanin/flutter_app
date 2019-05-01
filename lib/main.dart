import 'package:flutter/material.dart';

import 'panels.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Column(
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                TabBar(
                  tabs: [
                    TabItem(Icons.check, "Tasks"),
                    TabItem(Icons.star, "Goals"),
                    TabItem(Icons.person, "Me"),
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TasksPanel(),
              GoalsPanel(),
              ProfilePanel(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
          ),
        ),
      ),
      theme: ThemeData(
        primaryColor: Colors.green,
        indicatorColor: Colors.white,
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final icon;
  final text;

  const TabItem(this.icon, this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Column(
        children: <Widget>[Icon(icon), Text(text)],
      ),
    );
  }
}
