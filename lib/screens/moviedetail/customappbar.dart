import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_discovery_app/controllers/floatingbuttoncontroller.dart';
import 'package:movie_discovery_app/controllers/movie_detail_controller.dart';

class CustomAppBar extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final bool isButtonVisisble;

  const CustomAppBar(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.isButtonVisisble});

  @override
  Widget build(BuildContext context) {
    Get.put(FloatingButtomControllor());
    return Stack(children: [
      Container(
        height: screenHeight * 0.65,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://image.tmdb.org/t/p/original${Get.find<MovieDetailController>().movieDetail.posterPath}",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: SizedBox(
          height: screenWidth * 0.25,
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.02,
              left: screenWidth * 0.04,
              right: screenWidth * 0.04,
            ),
            child: GetBuilder<FloatingButtomControllor>(
              builder: (controller) {
                return AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  toolbarHeight: screenHeight * 0.14,
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  leadingWidth: screenWidth * 0.04,
                  centerTitle: true,
                  title: !Get.find<FloatingButtomControllor>().isVisible
                      ? Column(
                          children: [
                            Text(
                              Get.find<MovieDetailController>()
                                  .movieDetail
                                  .movieName,
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            Text(
                              "${Get.find<MovieDetailController>().movieDetail.runtime}  min",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  actions: [
                    !Get.find<FloatingButtomControllor>().isVisible
                        ? IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.play_circle_outline,
                              color: Colors.white,
                            ),
                          )
                        : const SizedBox(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      )
    ]);
  }
}
