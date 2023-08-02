import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<String> getPrediction() async {
    try {
      final response = await http.Client().get(Uri.parse("https://eightballapi.com/api"), headers: {
        'content-type': 'application/json; charset=utf-8',
        'Accept': "*/*"
      });
      if (response.statusCode == 200) {
        String str = jsonDecode(response.body)["reading"];
        print(str);
        return str;
      } else {
        throw Exception("Problems");
      }
    } catch(e) {
      return "Error";
    }
  }
}