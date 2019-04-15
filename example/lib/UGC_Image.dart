import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'asset_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multi_image_picker/asset.dart';
import 'package:multi_image_picker_example/globallist.dart';
import 'sendPostAPI.dart';

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

String dropdownValue = 'Family';

class UGC_Image extends StatefulWidget {
  UGC_Image({Key key}) : super(key: key);
  @override
  _UGC_ImageState createState() => new _UGC_ImageState();
}

class _UGC_ImageState extends State<UGC_Image> {
  String _accessToken = "";
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  static final TextEditingController _TitleOfPostController =
      TextEditingController();
  static final TextEditingController _PlaceController = TextEditingController();
  static final TextEditingController _AwesomeController =
      TextEditingController();
  static final TextEditingController _BetterController =
      TextEditingController();
  static final TextEditingController _CostController = TextEditingController();
  static final TextEditingController _GoWithController =
      TextEditingController();
  Widget _cached;
  bool _autoValidate = false;

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
      if (images.length != 0) {}
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
      if (resultList.length != 0) {}
      images = resultList;
      print(finalData.length);
      _error = error;
    });
  }

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SizedBox(
            height: 150,
            child: buildGridView(),
          ),
          Form(
            key: _formKey,
            child: Expanded(
              child: new Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: new ListView(
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.0)),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
