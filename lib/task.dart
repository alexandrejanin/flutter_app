import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final _name;

  Task(this._name);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  var done = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Card(
        child: InkWell(
          onTap: () => setState(() => done = !done),
          child: Row(
            children: <Widget>[
              Checkbox(
                value: done,
                onChanged: (value) => setState(() => done = value),
              ),
              Text(
                widget._name,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final _title;
  final _tasks;

  TaskList(this._title, this._tasks);

  @override
  Widget build(BuildContext context) {
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
