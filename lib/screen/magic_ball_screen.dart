import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen/magicBall.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen/magicOval.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepPurple, Colors.black])),
      child: const Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 200)),
                  MagicBallWidget(),
                  Padding(padding: EdgeInsets.only(top: 80)),
                  MagicOval(),
                  Padding(padding: EdgeInsets.only(top: 60)),
                  Text(
                    "Нажмите на шар",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )
                ],
              )
            ],
          )),
    );
  }
}
