import 'package:flutter/material.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movie_discovery_app/controllers/floatingbuttoncontroller.dart';

class FloatingButton extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;

  const FloatingButton({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FloatingButtomControllor>(
      builder: (controller) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          top: controller.isVisible
              ? widget.screenHeight * 0.43
              : widget.screenHeight * 0.52,
          left: widget.screenWidth * 0.4,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: controller.isVisible ? 1.0 : 0.0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 85.0,
                height: 85.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Icon(
                    LineIcons.play,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
