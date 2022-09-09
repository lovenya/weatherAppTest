import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  String? url;

  NetworkHelper(this.url);

  Future getData() async {
    Response response = await (http.get(Uri.parse(url!)));

    if (response.statusCode == 200) {
      String data = response.body;
      final decodeData = jsonDecode(data); //as Map<String, dynamic>;
      return decodeData;
    } else {
      print(response.statusCode);
    }
  }
}
