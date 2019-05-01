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
                    TabItem(icon: Icons.check, text: "Tasks"),
                    TabItem(icon: Icons.star, text: "Goals"),
                    TabItem(icon: Icons.person, text: "Me"),
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
            tooltip: "Add",
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final IconData _icon;
  final String _text;

  const TabItem({IconData icon, String text, Key key})
      : _icon = icon,
        _text = text,
        super(key: key);

  @override
  Widget build(context) {
    return Tab(
      child: Column(
        children: <Widget>[
          Icon(_icon),
          Text(_text),
        ],
      ),
    );
  }
}
