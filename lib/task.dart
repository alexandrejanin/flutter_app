import 'dart:async';

import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String _name;
  final String _notes;

  Task({@required String name, String notes})
      : _name = name,
        _notes = notes;

  @override
  createState() => TaskState();
}

class TaskState extends State<Task> {
  bool _done = false;
  String _name;
  String _notes;

  bool get done => _done;

  String get name => _name == null ? "" : _name;

  String get notes => _notes == null ? "" : _notes;

  set done(bool done) => setState(() => _done = done);

  set name(String name) => setState(() => _name = name);

  set notes(String notes) => setState(() => _notes = notes);

  @override
  void initState() {
    super.initState();
    _name = widget._name;
    _notes = widget._notes;
  }

  @override
  Widget build(context) {
    return Container(
      height: 50,
      child: InkWell(
        onLongPress: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TaskEditScreen(
                      taskState: this,
                    ),
              ),
            ),
        onTap: () => done = !_done,
        child: Row(
          children: <Widget>[
            Checkbox(
              value: _done,
              onChanged: (checked) => done = checked,
            ),
            _taskText(),
          ],
        ),
      ),
    );
  }

  _taskText() {
    final nameText = Text(
      name,
      style: TextStyle(
        fontSize: 16,
        decoration: _done ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );

    if (notes.isEmpty) {
      return nameText;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        nameText,
        Text(
          notes,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class TaskEditScreen extends StatefulWidget {
  final TaskState _taskState;

  const TaskEditScreen({@required TaskState taskState, Key key})
      : _taskState = taskState,
        super(key: key);

  @override
  createState() => TaskEditScreenState();
}

class TaskEditScreenState extends State<TaskEditScreen> {
  final _taskNameController = TextEditingController();
  final _taskNotesController = TextEditingController();

  bool _unsavedChanges() =>
      _taskNameController.text != widget._taskState.name ||
      _taskNotesController.text != widget._taskState.notes;

  void _saveChanges() {
    widget._taskState.name = _taskNameController.text;
    widget._taskState.notes = _taskNotesController.text;
  }

  Future<bool> _onBackPressed() {
    if (!_unsavedChanges()) {
      var completer = Completer<bool>();
      completer.complete(true);
      return completer.future;
    }
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("Discard changes?"),
            actions: <Widget>[
              FlatButton(
                child: Text("No"),
                onPressed: () => Navigator.pop(context, false),
              ),
              FlatButton(
                child: Text("Yes"),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          ),
    );
  }

  @override
  void initState() {
    super.initState();
    _taskNameController.text = widget._taskState.name;
    _taskNotesController.text = widget._taskState.notes;
  }

  @override
  Widget build(context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Task"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {
                _saveChanges();
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _taskNameController,
                decoration: InputDecoration(
                  labelText: "Task Name",
                ),
              ),
              TextField(
                controller: _taskNotesController,
                decoration: InputDecoration(
                  labelText: "Task Notes",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskNotesController.dispose();
    super.dispose();
  }
}
