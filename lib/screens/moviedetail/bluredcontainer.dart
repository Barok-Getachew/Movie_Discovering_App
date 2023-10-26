import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class BluredContainer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const BluredContainer(
      {super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: screenHeight * 0.14,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.00),
        child: BlurryContainer(
          blur: 1,
          width: screenHeight * 0.01,
          height: screenHeight * 0.02,
          elevation: 0,
          color: const Color.fromARGB(140, 255, 255, 255),
          padding: const EdgeInsets.all(8),
          child: const SizedBox(),
        ),
      ),
    );
  }
}
