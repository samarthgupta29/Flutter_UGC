import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:multi_image_picker_example/platformScaffold.dart';
import 'package:multi_image_picker_example/basicDrawer.dart';
import 'package:multi_image_picker_example/sendPostAPI.dart';
import 'package:multi_image_picker_example/globallist.dart';

void main() {
  runApp(UGC_Form1());
}

class UGC_Form1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark(),
      home: UGC_Form(),
    );
  }
}

String _accessToken = "";
String dropdownValue = 'Family';

class UGC_Form extends StatefulWidget {
  @override
  _UGC_FormState createState() => _UGC_FormState();
}

class _UGC_FormState extends State<UGC_Form> {
  final TextEditingController _TitleOfPostController = TextEditingController();
  final TextEditingController _PlaceController = TextEditingController();
  final TextEditingController _AwesomeController = TextEditingController();
  final TextEditingController _BetterController = TextEditingController();
  final TextEditingController _CostController = TextEditingController();
  final TextEditingController _GoWithController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _saveCurrentRoute("/UGC_Form");
    _getAccessTokenDisplay();
    print(finalData);
  }

  _getAccessTokenDisplay() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _accessToken = pref.getString("auth_token");
    });
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      //drawer: BasicDrawer(),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: ListView(
              children: <Widget>[
                new ListTile(
                  leading: const Icon(
                    Icons.title,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: new TextFormField(
                      controller: _TitleOfPostController,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: new InputDecoration(
                          labelText: "Title of the Post",
                          border: OutlineInputBorder()),
                      maxLines: null,
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(
                    Icons.place,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: new TextFormField(
                      controller: _PlaceController,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: new InputDecoration(
                          labelText: "Where Did You FInd This?",
                          border: OutlineInputBorder()),
                      maxLines: null,
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(
                    Icons.mood,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: new TextFormField(
                      controller: _AwesomeController,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: new InputDecoration(
                          labelText: "What Makes It Awesome?",
                          border: OutlineInputBorder()),
                      maxLines: null,
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(
                    Icons.mood_bad,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: new TextFormField(
                      controller: _BetterController,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: new InputDecoration(
                          labelText: "What Could Be Better?",
                          border: OutlineInputBorder()),
                      maxLines: null,
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(
                    Icons.monetization_on,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: new TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _CostController,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: new InputDecoration(
                          labelText: "How Much Did It Cost?",
                          border: OutlineInputBorder()),
                      maxLines: null,
                    ),
                  ),
                ),
                new Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 73.0),
                    child: new Text(
                      "Best To Go With?",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                new ListTile(
                  leading: const Icon(
                    Icons.people,
                  ),
                  title: new DropdownButton<String>(
                    isDense: true,
                    isExpanded: true,
                    value: dropdownValue,
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Family',
                      'Big Group',
                      'Bae',
                      'Kids',
                      'Pets'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                  child: Container(
                    height: 65.0,
                    child: RaisedButton(
                      onPressed: () {
                        print("Tapped POST");
                        sendPostAPI(
                            context,
                            _TitleOfPostController.text,
                            _PlaceController.text,
                            _AwesomeController.text,
                            _BetterController.text,
                            _CostController.text,
                            dropdownValue);
                      },
                      child: Text("Post On LBB",
                          style:
                              TextStyle(color: Colors.white, fontSize: 22.0)),
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
