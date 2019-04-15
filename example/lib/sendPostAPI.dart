import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'UGC_Image.dart';
import 'asset_view.dart';
import 'globallist.dart';
import 'UGC_SuccessPost.dart';

Future sendPostAPI(BuildContext context, String TitleOfPost, String Place,
    String Awesome, String Better, String Cost, String Best) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  print(pref.getString("auth_token"));
  print("Bearer" + " " + pref.getString("auth_token"));

  Map body = {
    "publish_status": "draft",
    "curation_status": "curated",
    "curated": true,
    "flag": "In-progress",
    "mode": "Private",
    "custom_place": {"name": Place, "type": "Place"},
    "place_type": "custom_place",
    "provider": pref.getString("provider_city"),
    "sections": [
      {
        "content": Awesome,
        "local_number": 2,
        "qid": 1,
        "title": "What Makes It Awesome"
      },
      {
        "content": Better,
        "local_number": 3,
        "qid": 2,
        "title": "What Could Be Better"
      },
      {
        "content": Cost,
        "local_number": 4,
        "qid": 3,
        "title": "How Much Did It Cost"
      },
      {"content": Best, "local_number": 5, "qid": 4, "title": "Best To Go With"}
    ],

    ///TODO : Upload Media as a List
    "media": finalData,
    "Tags": [],
    "title": TitleOfPost
  };

  final response = await http.post("http://testapi.lbb.in:3000/discoveries",
      headers: {
        "Authorization": getAccessToken(pref),
        "client_id": "android",
        "content-type": "application/json",
        "client_secret":
            "4979c84882e1b78f36ca3eaf5daa26b2bd070d03d547bff572ad701ab445622b",
      },
      body: json.encode(body));

  if (response.statusCode == 200) {
    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new UGC_SuccessPost()));
    finalData.clear();
  }
}

String getAccessToken(SharedPreferences pref) {
  return "Bearer" + " " + (pref.getString("auth_token"));
}
