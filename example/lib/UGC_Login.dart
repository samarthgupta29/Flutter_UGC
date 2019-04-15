import 'dart:io';
import 'package:flutter/material.dart';
import 'package:multi_image_picker_example/requestLoginAPI.dart';

void main() {
  runApp(MyAppThree());
}

class MyAppThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark(),
      home: new UGC_Login(),
    );
  }
}

class UGC_Login extends StatefulWidget {
  @override
  _UGC_LoginState createState() => _UGC_LoginState();
}

class _UGC_LoginState extends State<UGC_Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  ///TODO : Move these variables in Config File.
  final String client_id = "android";
  final String client_secret =
      "4979c84882e1b78f36ca3eaf5daa26b2bd070d03d547bff572ad701ab445622b";
  final String grant_type = "password";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: new Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: new Text("LBB - Internal"),
            centerTitle:true,
            backgroundColor: Colors.teal,
            automaticallyImplyLeading: false,
          ),
          resizeToAvoidBottomPadding: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                      child: Text('Login',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                      child: Text('.',
                          style: TextStyle(
                              fontSize: 80.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal)),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        controller: _userNameController,
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            labelText: 'PASSWORD',
                            labelStyle: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal))),
                        obscureText: true,
                      ),
                      SizedBox(height: 40.0),
                      Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.teal,
                          elevation: 7.0,
                          child: InkWell(
                            onTap: () {
                              if (_userNameController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                _scaffoldKey.currentState
                                    .showSnackBar(new SnackBar(
                                        duration: Duration(seconds: 1),
                                        content: new Text(
                                          "Processing Login...",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        )));
                                requestLoginAPI(
                                    context,
                                    _userNameController.text,
                                    _passwordController.text,
                                    client_id,
                                    client_secret,
                                    grant_type);
                              } else {
                                _scaffoldKey.currentState
                                    .showSnackBar(new SnackBar(
                                        duration: Duration(seconds: 3),
                                        content: new Text(
                                          "Username & Password Cannot Be Empty",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        )));
                              }
                            },
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }
}
