import 'package:flutter/material.dart';

class MagicOval extends StatelessWidget {
  const MagicOval({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipOval(
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(100, 25, 180, 150),
                  blurRadius: 40,
                  blurStyle: BlurStyle.normal),
            ]
          ),
          height: 50.0,
          width: 140.0,
        ),
      ),
    );
  }
}
