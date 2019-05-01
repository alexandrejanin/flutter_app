import 'dart:async';

import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String _name;
  final String _notes;

  Task(this._name, this._notes);

  @override
  createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool _done = false;
  String _name;
  String _notes;

  get done => _done;

  get name => _name;

  get notes => _notes;

  set done(bool done) => setState(() => _done = done);

  set name(String name) => setState(() => _name = name);

  set notes(String notes) => setState(() => _notes = notes);

  Widget _taskText() {
    final nameText = Text(
      _name,
      style: TextStyle(
        fontSize: 16,
        decoration: _done ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
    return _notes.isEmpty
        ? nameText
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              nameText,
              Text(
                _notes,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          );
  }

  @override
  void initState() {
    super.initState();
    _name = widget._name;
    _notes = widget._notes;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: InkWell(
        onLongPress: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => TaskEditScreen(this))),
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
}

class TaskEditScreen extends StatefulWidget {
  final _TaskState _taskState;

  const TaskEditScreen(this._taskState, {key}) : super(key: key);

  @override
  createState() => _TaskEditScreenState();
}

class _TaskEditScreenState extends State<TaskEditScreen> {
  final _taskNameController = TextEditingController();
  final _taskNotesController = TextEditingController();

  bool _unsavedChanges() =>
      _taskNameController.text != widget._taskState.name ||
      _taskNotesController.text != widget._taskState.notes;

  void _saveChanges() {
    widget._taskState.name = _taskNameController.text;
    widget._taskState.notes = _taskNotesController.text;
  }

  void _submit(BuildContext context) {
    _saveChanges();
    Navigator.pop(context);
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
    _taskNameController.text = widget._taskState._name;
    _taskNotesController.text = widget._taskState._notes;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Task"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () => _submit(context),
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
                onEditingComplete: _saveChanges,
                decoration: InputDecoration(
                  labelText: "Task Name",
                ),
              ),
              TextField(
                controller: _taskNotesController,
                onEditingComplete: _saveChanges,
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
