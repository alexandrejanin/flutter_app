import 'package:flutter/material.dart';

import 'goal.dart';
import 'task_list.dart';

// Panel

/// Represents a panel of the app's main screen.
abstract class Panel extends StatefulWidget {
  Panel({Key key}) : super(key: key);

  @override
  createState();
}

abstract class PanelState extends State<Panel>
    with AutomaticKeepAliveClientMixin {
  @override
  get wantKeepAlive => true;
}

// TasksPanel

class TasksPanel extends Panel {
  TasksPanel({Key key}) : super(key: key);

  @override
  createState() => _TasksPanelState();
}

class _TasksPanelState extends PanelState {
  _getTaskLists() => <Widget>[
        TaskList(title: "Finances"),
        TaskList(title: "Career"),
      ];

  @override
  Widget build(context) {
    super.build(context);
    return ListView(
      physics: AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      children: _getTaskLists(),
    );
  }
}

// GoalsPanel

class GoalsPanel extends Panel {
  GoalsPanel({Key key}) : super(key: key);

  @override
  createState() => _GoalsPanelState();
}

class _GoalsPanelState extends PanelState {
  @override
  Widget build(context) {
    super.build(context);
    return ListView(
      physics: AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      children: <Widget>[
        Goal("Finances", "Be rich"),
        Goal("Health", "Be healthy"),
        Goal("Career", "Be CEO"),
      ],
    );
  }
}

// ProfilePanel

class ProfilePanel extends Panel {
  ProfilePanel({Key key}) : super(key: key);

  @override
  createState() => ProfilePanelState();
}

class ProfilePanelState extends PanelState {
  final String _username = "KBanana";

  @override
  Widget build(context) {
    super.build(context);
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _username,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
