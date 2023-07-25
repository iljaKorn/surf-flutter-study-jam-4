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
  String ballText = "";

  getData() async {
    var prediction = await ApiService().getPrediction();
    setState(() {
      ballText = prediction;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/images/stars.jpg"),
                  fit: BoxFit.cover),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(200, 200, 200, 180),
                    blurRadius: 30,
                    offset: Offset(5, 8),
                    blurStyle: BlurStyle.solid),
              ],
              // button text
            ),
            child: Center(
                child: Text(
              ballText,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ))),
        onTap: () {
          getData();
        });
  }
}
