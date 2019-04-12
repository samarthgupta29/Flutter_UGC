import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:multi_image_picker/asset.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show utf8, json;
import 'package:multi_image_picker_example/globallist.dart';

class AssetView extends StatefulWidget {
  final int _index;
  final Asset _asset;

  AssetView(this._index, this._asset, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AssetState(this._index, this._asset);
}

class AssetState extends State<AssetView> {
  int _index = 0;
  Asset _asset;

  //final Map<String, List<String>> uploadedImagesData = new Map();
  //final List<dynamic> finalData=new List();

  AssetState(this._index, this._asset);

  @override
  void initState() {
    _loadImage();
    super.initState();
    if (context != null) {
      //_uploadImages();
    }
  }

  void _uploadImages() async {}

  void _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Uri uri = Uri.parse('http://testapi.lbb.in:3000/media');
    var request = http.MultipartRequest("POST", uri);
    request.headers['authorization'] = getAccessToken(prefs);
    ByteData byteData = await this._asset.requestOriginal();
    List<int> imageData = byteData.buffer.asUint8List();

    var multipartfile = http.MultipartFile.fromBytes(
      'image',
      imageData,
      filename: 'image.jpg',
      contentType: MediaType("image", "jpg"),
    );
    request.files.add(multipartfile);
    var response = await request.send();
    String responseData = await response.stream
        .transform(utf8.decoder)
        .join(); // decodes on response data using UTF8.decoder
    //print(responseData);
    Map data = (json.decode(responseData)); // Parse data from JSON string
    //print(data);
    //var source = data['source'];
    //var dataID = data['id'];
    if (response.statusCode == 200) {
      await finalData.add(data);
    }
    //finalData.add(dataID);
    print(finalData);
    //print(source + "  " + dataID);
    this._asset.releaseOriginal();
    /*var ifEmpty = () {
      var list = new List(1);
      list[0] = source;
      return list;
    };*/
    /*if(uploadedImagesData.containsKey("source")){
      var currentSource = uploadedImagesData["source"];
      currentSource.add(source);
      uploadedImagesData.update("source",(List<String>)=>currentSource);
    } else {
      uploadedImagesData.putIfAbsent("source", ifEmpty);
    }*/
    //print(uploadedImagesData["source"]);
    print(response.statusCode);
    if (response.statusCode != 200) {
      print("Error Uploading");
    } else {
      await this._asset.requestThumbnail(300, 300, quality: 50);
    }

    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this._asset.thumbData == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (null != this._asset.thumbData) {
      return Image.memory(
        this._asset.thumbData.buffer.asUint8List(),
        fit: BoxFit.cover,
        gaplessPlayback: true,
      );
    }

    return Text(
      '${this._index}',
      style: Theme.of(context).textTheme.headline,
    );
  }
}

String getAccessToken(SharedPreferences pref) {
  return "Bearer" + " " + (pref.getString("auth_token"));
}
