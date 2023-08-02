import 'package:flutter/material.dart';
import 'package:surf_practice_magic_ball/service/api_service.dart';

class MagicBallWidget extends StatefulWidget {
  const MagicBallWidget({super.key});

  @override
  State<MagicBallWidget> createState() => _MagicBallWidgetState();
}

class _MagicBallWidgetState extends State<MagicBallWidget>
    with SingleTickerProviderStateMixin {
  String ballText = "";

  double _scale = 1;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 50),
      lowerBound: 0.0,
      upperBound: 0.5,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  getData() async {
    var prediction = await ApiService().getPrediction();
    setState(() {
      ballText = prediction;
    });
  }

  void onTapUp(TapUpDetails details) {
    _animationController.forward();
  }

  void onTapDown(TapDownDetails details) {
    _animationController.reverse();
  }

  void onTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 + _animationController.value;

    return GestureDetector(
        onTap: () {
          getData();
        },
        onTapUp: onTapUp,
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        child: Transform.scale(
          scale: _scale,
          child: Container(
              width: 270,
              height: 270,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/stars.jpg"),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 15,
                      offset: Offset(6, 6),
                      spreadRadius: 1),
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 15,
                      offset: Offset(-6, -6),
                      spreadRadius: 1),
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
        ));
  }
}
