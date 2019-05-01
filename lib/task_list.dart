import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final _title;
  final _tasks;

  TaskList(this._title, this._tasks);

  @override
  build(context) {
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
              children: _tasks,
            ),
          ],
        ),
      ),
    );
  }
}
