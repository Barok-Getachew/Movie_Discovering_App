import 'package:flutter/material.dart';
import 'package:movie_discovery_app/screen/moviedetail/buytickedbutton.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class BottomContainer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const BottomContainer(
      {super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
        child: Container(
          width: double.infinity,
          height: screenHeight * 0.14,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TicketButton(
                screenWidth: screenWidth,
              ),
              CircularPercentIndicator(
                radius: screenWidth * 0.072,
                lineWidth: screenWidth * 0.008,
                percent: 0.8,
                progressColor: Colors.black,
                center: const Text(
                  "9.1",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
