import 'package:flutter/material.dart';

import 'goal.dart';
import 'task.dart';

// Panel

abstract class Panel extends StatefulWidget {
  Panel({Key key}) : super(key: key);

  @override
  PanelState createState();
}

abstract class PanelState extends State<Panel>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
}

// TasksPanel

class TasksPanel extends Panel {
  TasksPanel({Key key}) : super(key: key);

  @override
  _TasksPanelState createState() => _TasksPanelState();
}

class _TasksPanelState extends PanelState {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      physics: AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      children: <Widget>[
        TaskList("Finances", <Task>[
          Task("Spend less than 40€ on groceries"),
          Task("No more than 5€ per lunch"),
          Task("Look into rent-lowering options"),
        ])
      ],
    );
  }
}

// GoalsPanel

class GoalsPanel extends Panel {
  GoalsPanel({Key key}) : super(key: key);

  @override
  _GoalsPanelState createState() => _GoalsPanelState();
}

class _GoalsPanelState extends PanelState {
  @override
  Widget build(BuildContext context) {
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
  ProfilePanelState createState() => ProfilePanelState();
}

class ProfilePanelState extends PanelState {
  final _username = "KBanana";

  @override
  Widget build(BuildContext context) {
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
