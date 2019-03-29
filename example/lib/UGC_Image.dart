import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'asset_view.dart';
import 'UGC_Form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multi_image_picker/asset.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8, json;
import 'package:multi_image_picker_example/globallist.dart';

void main() {
  runApp(UGC_Image1());
}

class UGC_Image1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark(),
      home: UGC_Image(),
    );
  }
}

class UGC_Image extends StatefulWidget {
  @override
  _UGC_ImageState createState() => new _UGC_ImageState();
}

class _UGC_ImageState extends State<UGC_Image> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _accessToken = "";
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  @override
  void initState() {
    super.initState();
    _getAccessTokenDisplay();
    //upload();
  }

  _getAccessTokenDisplay() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _accessToken = pref.getString("auth_token");
    });
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetView(
          index,
          asset,
          key: UniqueKey(),
        );

      }),
    );
  }

  Future<void> deleteAssets() async {
    await MultiImagePicker.deleteImages(assets: images);
    setState(() {
      images = List<Asset>();
    });
  }

  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();
      if (images.length != 0) {
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
            content: new Text(
          "Please Wait While Images Are Being Uploaded...",
          style: TextStyle(fontWeight: FontWeight.w500),
        )));
      }
    });

    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        options: CupertinoOptions(takePhotoIcon: "chat"),
      );
    } on PlatformException catch (e) {
      error = e.message;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      if (resultList.length != 0) {
        _scaffoldKey.currentState.showSnackBar(new SnackBar(
            duration: Duration(seconds: 30),
            content: new Text(
              "Please Do Not Navigate To Any Other Screen While Your Images Are Being Uploaded...",
              style: TextStyle(fontWeight: FontWeight.w500),
            )));
      }
      images = resultList;
      print(finalData.length);
      _error = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Images Upload'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Center(/*child: Text('Error: $_error')*/),
          RaisedButton(
            child: Text("Pick images"),
            onPressed: loadAssets,
          ),
          Expanded(
            child: buildGridView(),
          ),
        ],
      ),
      floatingActionButton: new Container(
              height: 70.0,
              width: 70.0,
              child: FittedBox(
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            maintainState: false,
                            builder: (context) => new UGC_Form()));
                  },
                  child: new IconTheme(
                      data: new IconThemeData(color: Colors.black),
                      child: new Icon(Icons.forward)),
                ),
              ),
            ),
    );
  }
}
