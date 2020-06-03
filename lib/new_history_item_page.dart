import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'model/history.dart';

class NewHistoryItemPage extends StatefulWidget {
  @override
  _NewHistoryItemPageState createState() => _NewHistoryItemPageState();
}

class _NewHistoryItemPageState extends State<NewHistoryItemPage> {
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  bool _value6 = false;
  bool _value7 = false;
  bool _value8 = false;
  bool _value9 = false;
  bool _value10 = false;

  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);
  void _value3Changed(bool value) => setState(() => _value3 = value);
  void _value4Changed(bool value) => setState(() => _value4 = value);
  void _value5Changed(bool value) => setState(() => _value5 = value);
  void _value6Changed(bool value) => setState(() => _value6 = value);
  void _value7Changed(bool value) => setState(() => _value7 = value);
  void _value8Changed(bool value) => setState(() => _value8 = value);
  void _value9Changed(bool value) => setState(() => _value9 = value);
  void _value10Changed(bool value) => setState(() => _value10 = value);

  bool completed() {
    return _value1 &&
        _value2 &&
        _value3 &&
        _value4 &&
        _value5 &&
        _value6 &&
        _value7 &&
        _value8 &&
        _value9 &&
        _value10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yeni Kayıt"),
        ),
        body: Column(
          children: <Widget>[
            CheckboxListTile(
              value: _value1,
              onChanged: _value1Changed,
              title: Text("Elektrik şalterini aç"),
            ),
            CheckboxListTile(
              value: _value2,
              onChanged: _value2Changed,
              title: Text("Bahçe musluğunu aç"),
            ),
            CheckboxListTile(
              value: _value3,
              onChanged: _value3Changed,
              title: Text("Sıcak suyu akıt"),
            ),
            CheckboxListTile(
              value: _value4,
              onChanged: _value4Changed,
              title: Text("Evi havalandır"),
            ),
            CheckboxListTile(
              value: _value5,
              onChanged: _value5Changed,
              title: Text("Tuvalet sifonlarına bas"),
            ),
            CheckboxListTile(
              value: _value6,
              onChanged: _value6Changed,
              title: Text("Merdiven altını aç"),
            ),
            CheckboxListTile(
              value: _value7,
              onChanged: _value7Changed,
              title: Text("Bahçeyi sula"),
            ),
            CheckboxListTile(
              value: _value8,
              onChanged: _value8Changed,
              title: Text("Merdiven altını kilitle"),
            ),
            CheckboxListTile(
              value: _value9,
              onChanged: _value9Changed,
              title: Text("Camları kapat"),
            ),
            CheckboxListTile(
              value: _value10,
              onChanged: _value10Changed,
              title: Text("Şalteri indir"),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: RaisedButton(
                  child: Text("Kaydet"),
                  onPressed: () {
                    if (completed()) {
                      Hive.box("timesheets").add(History(DateTime.now()));
                      Navigator.pop(context);
                    } else {
                      _showDialog();
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Uyarı"),
          content: new Text("Bütün işleri tamamlamadın !"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
