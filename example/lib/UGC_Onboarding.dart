import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'UGC_Login.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'UGC_Intro.dart';

void main() {
  runApp(MyAppTwo());
}

class MyAppTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: UGC_OnBoarding(),
    );
  }
}

class UGC_OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context)=> new UGC_Intro()));
      },
      child: new Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: new Text("LBB"),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 20.0, right: 16),
          child: Column(
            children: <Widget>[
              new Container(
                child: new Text(
                  "Let's Get Started",
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: new Container(
                  child: Row(
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons8-google-images-48.png",
                        height: 55.0,
                        width: 55.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "Add Photos",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: new Container(
                  child: Row(
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons8-smiling-48.png",
                        height: 55.0,
                        width: 55.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "Tell Us what You Liked",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: new Container(
                  child: Row(
                    children: <Widget>[
                      new Image.asset(
                        "assets/icons8-get-quote-48.png",
                        height: 55.0,
                        width: 55.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Text(
                          "Help Others Find Awesome",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          height: 70.0,
          width: 70.0,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new UGC_Login()));
              },
              child: Icon(
                Icons.forward,
              ),
            ),
          ),
        ),
      ),

    );
  }
}

