import 'package:batikent_todos/new_history_item_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/history.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Batıkent Günlükleri"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildListView(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'New',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewHistoryItemPage()),
            );
          }),
    );
  }

  Widget _buildListView() {
    final timesheetsBox = Hive.box("timesheets");

    final List<History> historyList = List<History>();
    timesheetsBox.toMap().forEach((key, value) {
      historyList.add(value);
    });
    final reversedHistoryList = historyList.reversed.toList();

    return WatchBoxBuilder(
      box: Hive.box("timesheets"),
      builder: (context, history) {
        return ListView.builder(
          itemCount: reversedHistoryList.length,
          itemBuilder: (context, index) {
            final history = reversedHistoryList[index];
            return ListTile(
              title: Text(operationDate(history.time)),
            );
          },
        );
      },
    );
  }

  String operationDate(DateTime date) {
    var month = date.month.toString().padLeft(2, '0');
    var day = date.day.toString().padLeft(2, '0');
    return '$day.$month.${date.year}';
  }
}
