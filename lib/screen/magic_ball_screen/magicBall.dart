import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'package:surf_practice_magic_ball/service/api_service.dart';
import 'package:surf_practice_magic_ball/models/prediction.dart';

class MagicBallWidget extends StatefulWidget {
  const MagicBallWidget({super.key});

  @override
  State<MagicBallWidget> createState() => _MagicBallWidgetState();
}

class _MagicBallWidgetState extends State<MagicBallWidget> {
  Color ballColor = Colors.purple;
  String ballText = "";

  getData() async {
    var prediction = await ApiService().getPrediction();
    setState(() {
      ballText = prediction;
    });
    //prediction = ApiService().getPrediction();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          fixedSize: Size(300, 300),
          backgroundColor: ballColor),
      onPressed: () {
        getData();
      },
      child: Text(
        ballText,
        style: TextStyle(fontSize: 25, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
