import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UGC_Form.dart';
import 'package:multi_image_picker_example/requestLoginAPI.dart';
import 'package:multi_image_picker_example/platformScaffold.dart';
import 'package:multi_image_picker_example/basicDrawer.dart';
import 'UGC_Onboarding.dart';

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
        moveToOnboardingScreen();
      },
      child: new Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.teal,
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
                          //shadowColor: Colors.greenAccent,
                          color: Colors.teal,
                          elevation: 7.0,
                          child: InkWell(
                            onTap: () {
                              print("tapped");
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

  void moveToOnboardingScreen() {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new UGC_OnBoarding()));
  }

  /*@override
  void initState() {
    super.initState();
    _saveCurrentRoute("/LoginScreen");
  }

  _saveCurrentRoute(String lastRoute) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('LastScreenRoute', lastRoute);
  }*/

  /*@override
  Widget build(BuildContext context) {
    return new PlatformScaffold(
      //drawer: BasicDrawer(),

      appBar: AppBar(
        title: Text(
          "LOGIN",
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
//      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 15.0),
                    child: Text(
                      "LBB Insiders",
                      style: TextStyle(fontSize: 40.0, color: Colors.black),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 78.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'LBB Admin Panel',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //launchURL(URL);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Username",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    hintText: "Use your web  User name",
                  ),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
                child: Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Your password, keep it secret, keep it safe.',
                  ),
                  obscureText: true,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                child: Container(
                  height: 65.0,
                  child: RaisedButton(
                    onPressed: () {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      requestLoginAPI(
                          context,
                          _userNameController.text,
                          _passwordController.text,
                          client_id,
                          client_secret,
                          grant_type);
                    },
                    child: Text("LOGIN",
                        style: TextStyle(color: Colors.white, fontSize: 22.0)),
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }*/
}
