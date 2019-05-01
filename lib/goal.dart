import 'package:flutter/material.dart';

class Goal extends StatelessWidget {
  final _category;
  final _title;

  Goal(this._category, this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 400,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 8),
                height: 32,
                child: Text(
                  _category,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              Text(
                _title,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
