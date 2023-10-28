import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:movie_discovery_app/controllers/floatingbuttoncontroller.dart';
import 'package:movie_discovery_app/controllers/movie_detail_controller.dart';
import 'package:movie_discovery_app/screens/home/home_screen.dart';

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
                  toolbarHeight: 100,
                  leading: Padding(
                    padding: const EdgeInsets.only(bottom: 13),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(screenWidth * 0.15),
                      onTap: () {
                        Get.offAll(const HomeScreen());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.15)),
                        child: const Icon(
                          LineIcons.arrowLeft,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  leadingWidth: screenWidth * 0.1,
                  centerTitle: true,
                  title: !Get.find<FloatingButtomControllor>().isVisible
                      ? Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Column(
                            children: [
                              Container(
                                // color: Colors.black12,
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  Get.find<MovieDetailController>()
                                      .movieDetail
                                      .movieName,
                                  style: GoogleFonts.roboto(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  "runtime: ${Get.find<MovieDetailController>().movieDetail.runtime} minutes",
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  actions: [
                    !Get.find<FloatingButtomControllor>().isVisible
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                LineIcons.playCircle,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 13),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_border_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
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
