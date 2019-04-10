import 'dart:io';

import 'package:flutter/material.dart';
import 'UGC_Onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      /*initialRoute: '/',
      routes: <String,WidgetBuilder>{
        "/HomeScreen": (BuildContext context) => UGC,
        "/LoginScreen": (BuildContext context) => LoginScreen(),
      },*/
      home: UGC_Intro(),
    );
  }
}

class UGC_Intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        exit(0);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: new Text("LBB"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20.0, right: 16),
            child: Column(
              children: <Widget>[
                new Container(
                  child: new Text(
                    "Found Something Awesome?",
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
                          "assets/icons8-food-48.png",
                          height: 55.0,
                          width: 55.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "A hidden gem for street food",
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
                          "assets/icons8-confectionery-48.png",
                          height: 55.0,
                          width: 55.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "The best place to order cakes",
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
                          "assets/icons8-beach-48.png",
                          height: 55.0,
                          width: 55.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            "A great hotel for a weekend getaway ",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                /*new RaisedButton(
                    color: Colors.amberAccent,
                    child: new Text("Submit"),
                    onPressed: () {
                      Navigator.pushNamed(context,'/second');
                    }),*/
                Padding(
                  padding: const EdgeInsets.only(top: 300.0),
                  child: InkWell(
                    child: new Container(
                      width: 320.0,
                      height: 60.0,
                      alignment: FractionalOffset.center,
                      decoration: new BoxDecoration(
                        color: const Color.fromRGBO(247, 64, 106, 1.0),
                        borderRadius:
                            new BorderRadius.all(const Radius.circular(30.0)),
                      ),
                      child: new Text(
                        "Post on LBB",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                    onTap: () {
                      print("BUTTON TAPPED");
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new UGC_OnBoarding()));
                    },
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
