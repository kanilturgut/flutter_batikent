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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListItem(
                checked: _value1,
                onChange: _value1Changed,
                text: "Elektrik şalterini aç",
              ),
              ListItem(
                checked: _value2,
                onChange: _value2Changed,
                text: "Bahçe musluğunu aç",
              ),
              ListItem(
                checked: _value3,
                onChange: _value3Changed,
                text: "Sıcak suyu akıt",
              ),
              ListItem(
                checked: _value4,
                onChange: _value4Changed,
                text: "Evi havalandır",
              ),
              ListItem(
                checked: _value5,
                onChange: _value5Changed,
                text: "Tuvalet sifonlarına bas",
              ),
              ListItem(
                checked: _value6,
                onChange: _value6Changed,
                text: "Merdiven altını aç",
              ),
              ListItem(
                checked: _value7,
                onChange: _value7Changed,
                text: "Bahçeyi sula",
              ),
              ListItem(
                checked: _value8,
                onChange: _value8Changed,
                text: "Merdiven altını kilitle",
              ),
              ListItem(
                checked: _value9,
                onChange: _value9Changed,
                text: "Camları kapat",
              ),
              ListItem(
               checked: _value10,
               onChange: _value10Changed,
               text: "Şalteri indir",
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
          ),
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

class ListItem extends StatelessWidget {
  final String text;
  final bool checked;
  final ValueChanged<bool> onChange;

  const ListItem({Key key, this.checked, this.text, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: checked,
      onChanged: onChange,
      title: Text(text),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
