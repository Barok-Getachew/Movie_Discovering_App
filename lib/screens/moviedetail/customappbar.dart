import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_discovery_app/controllers/floatingbuttoncontroller.dart';


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
    return Stack(children: [
      Container(
        height: screenHeight * 0.5,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: screenHeight * 0.0,
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
                  title: !controller.isVisible
                      ? Column(
                          children: [
                            const Text(
                              "Jokkr",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: screenHeight * 0.01,
                            ),
                            const Text(
                              "Runtime:2hr 2min",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  actions: [
                    isButtonVisisble
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
