import 'package:flutter/material.dart';

class MagicBallScreen extends StatelessWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.indigo, Colors.black])),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 200)),
                  ElevatedButton(
                    child: Text("Нажми на меня"),
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), fixedSize: Size(300, 300)),
                    onPressed: () {},
                  ),
                  Padding(padding: EdgeInsets.only(top: 50)),
                  ElevatedButton(
                      onPressed: () {}, child: Text("Тут будет овал")),
                  Padding(padding: EdgeInsets.only(top: 60)),
                  Text(
                    "Нажмите на шар",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              )
            ],
          )),
    );
  }
}
