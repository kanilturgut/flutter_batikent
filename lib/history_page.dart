

import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Batıkent Todo\'s"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: _buildListView(),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'New',
        onPressed: _createNew
      ),
    );

  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: 55,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("deneme $index"),
        );
      },
    );
  }

  void _createNew() {

  }
}