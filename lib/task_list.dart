import 'package:flutter/material.dart';

import 'task.dart';

class TaskList extends StatelessWidget {
  final String _title;

  TaskList({@required String title}) : _title = title;

  List<Task> _getTasks() {
    switch (_title) {
      case "Finances":
        return <Task>[
          Task(name: "Spend less than 40€ on groceries"),
          Task(name: "No more than 5€ per lunch"),
          Task(name: "Look into rent-lowering options"),
        ];
      case "Career":
        return <Task>[
          Task(name: "Complete Flutter training"),
          Task(name: "Update resume"),
        ];
    }

    return null;
  }

  @override
  Widget build(context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            Column(
              children: _getTasks(),
            ),
          ],
        ),
      ),
    );
  }
}
