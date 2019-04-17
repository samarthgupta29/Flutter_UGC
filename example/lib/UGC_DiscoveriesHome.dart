import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'UGC_Image.dart';
import 'UGC_Login.dart';

void main() {
  runApp(UGC_DiscoveriesHome1());
}

class UGC_DiscoveriesHome1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark(),
      home: new UGC_DiscoveriesHome(),
    );
  }
}

class UGC_DiscoveriesHome extends StatefulWidget {
  @override
  _UGC_DiscoveriesHomeState createState() => _UGC_DiscoveriesHomeState();
}

class _UGC_DiscoveriesHomeState extends State<UGC_DiscoveriesHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List data1;
  Future<String> makeRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await http.get(Uri.encodeFull(
        "http://api.lbb.in/panther/discoveries?search_by_author=${prefs.getString("userMongoId")}"));

    setState(() {
      var extractData = json.decode(response.body);
      data1 = extractData["discoveries"];
    });
  }

  @override
  void initState() {
    //this.showSnackBar();
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((_) => _displaySnackBar);
    this.makeRequest();
  }

  void get _displaySnackBar {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: new Text(
        "Please Wait While Discoveries Are Being Fetched...",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        moveToLoginScreen();
      },
      child: new Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: new Text("Your Discoveries"),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      //maintainState: false,
                      builder: (context) => new UGC_Image()));
            },
            child: Icon(Icons.add),
          ),
          body: new ListView.builder(
            itemCount: data1 == null ? 0 : data1.length,
            itemBuilder: (BuildContext context, i) {
              if (data1[i]['flag'].toString().contains("In-progress")) {
                return ListTile(
                  title: new Text(data1[i]['title']),
                  subtitle: new Text(
                      "${data1[i]['createdAt'].toString().substring(0, 10)}"),
                  leading: CircleAvatar(
                    backgroundColor: Colors.amber,
                  ),
                );
              } else if (data1[i]['flag'].toString().contains("Done")) {
                return ListTile(
                  title: new Text(data1[i]['title']),
                  subtitle: new Text(
                      "${data1[i]['createdAt'].toString().substring(0, 10)}"),
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                  ),
                );
              }
            },
          )),
    );
  }

  void moveToLoginScreen() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new UGC_Login()));
  }
}
