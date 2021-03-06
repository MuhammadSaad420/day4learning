import 'package:flutter/material.dart';
import 'package:navigation_route/model/database_helper.dart';

import 'package:navigation_route/routes.dart';

class HomePage extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;
  HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => showDialog(
          context: context,
          builder: (context) => AlertDialog(
              title: Text('Are you sure you want to quit?'),
              actions: <Widget>[
                // ignore: deprecated_member_use
                RaisedButton(
                    child: Text('sign out'),
                    onPressed: () => Navigator.of(context).pop(true)),
                // ignore: deprecated_member_use
                RaisedButton(
                    child: Text('cancel'),
                    onPressed: () => Navigator.of(context).pop(false)),
              ]),
        ),
        child: Container(
          child: Center(
// ignore: deprecated_member_use
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {
                    _insert();
                  },
                  child: const Text("Create Table"),
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {
                    _query();
                  },
                  child: const Text("query"),
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {
                    _update();
                  },
                  child: const Text("update"),
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                  onPressed: () {
                    _delete();
                  },
                  child: const Text("delete"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: 'Bob',
      DatabaseHelper.columnAge: 23
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: 1,
      DatabaseHelper.columnName: 'Mary',
      DatabaseHelper.columnAge: 32
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }
}
