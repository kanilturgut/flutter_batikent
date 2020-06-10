import 'package:batikent_todos/new_history_item_page.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    return WatchBoxBuilder(
      box: Hive.box("timesheets"),
      builder: (context, box) {
        final List historyList = box.toMap().values.toList().reversed.toList();

        return ListView.builder(
          itemCount: historyList.length,
          itemBuilder: (context, index) {
            final history = historyList[index];
            return ListTile(
              title: Text(operationDate(history.time)),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // return object of type Dialog
                      return AlertDialog(
                        title: new Text("Uyarı"),
                        content: new Text(
                            "Silme işlemine devam etmek istiyor musun?"),
                        actions: <Widget>[
                          // usually buttons at the bottom of the dialog
                          FlatButton(
                            child: Text("Evet"),
                            onPressed: () {
                              box.deleteAt(historyList.length - 1 - index);
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text("Hayır"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
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
