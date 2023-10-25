import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:movie_discovery_app/controllers/movie_detail_controller.dart';
import 'package:movie_discovery_app/screens/moviedetail/buytickedbutton.dart';
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
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
        child: Container(
          width: double.infinity,
          height: screenHeight * 0.14,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.086),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TicketButton(
                  screenWidth: screenWidth,
                ),
                CircularPercentIndicator(
                  radius: screenWidth * 0.072,
                  lineWidth: screenWidth * 0.008,
                  percent:
                      Get.find<MovieDetailController>().movieDetail.rating / 10,
                  progressColor: Colors.black,
                  center: Text(
                    Get.find<MovieDetailController>()
                        .movieDetail
                        .rating
                        .toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
