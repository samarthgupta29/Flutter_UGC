import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'UGC_DiscoveriesHome.dart';

Future requestLoginAPI(BuildContext context, String username, String password,
    String client_id, String client_secret, String grant_type) async {
  final url = "http://testapi.lbb.in:4000/auth/oauth/token";

  ///TODO - Use Model Class
  Map body = {
    'username': username,
    'password': password,
    'client_id': "android",
    'client_secret':
        "4979c84882e1b78f36ca3eaf5daa26b2bd070d03d547bff572ad701ab445622b",
    'grant_type': "password"
  };

  SharedPreferences prefs = await SharedPreferences.getInstance();

  final response = await http.post(
    url,
    body: body,
  );

  print("LOGIN RESPONSE CODE : ${response.statusCode}");

  if (response.statusCode == 200) {
    print("Successful Login");
    final responseJson = json.decode(response.body);
    prefs.setString("auth_token", responseJson["access_token"]);
    prefs.setString("userMongoId", responseJson["user"]["_id"]);
    prefs.setString("provider_city", responseJson["user"]["city"]);
    print(prefs.getString("auth_token"));
    print(prefs.getString("userMongoId"));
    print(prefs.getString("provider_city"));

    Navigator.push(context,
        new MaterialPageRoute(builder: (context) => new UGC_DiscoveriesHome()));
  }
}
