import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:surf_practice_magic_ball/models/prediction.dart';

class ApiService {
  Future<String> getPrediction() async {
    final response = await http.Client().get(Uri.parse("https://eightballapi.com/api"), headers: {
      'content-type': 'application/json; charset=utf-8',
      'Accept': "*/*"
    });
    if (response.statusCode == 200) {
      String str = jsonDecode(response.body)["reading"];
      print(str);
      return str;
    } else {
      throw Exception('Failed to load prediction');
    }
  }
}