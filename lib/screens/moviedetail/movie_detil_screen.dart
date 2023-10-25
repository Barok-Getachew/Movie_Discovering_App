import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_discovery_app/controllers/actorlistcontroller.dart';
import 'package:movie_discovery_app/controllers/floatingbuttoncontroller.dart';
import 'package:movie_discovery_app/controllers/image_from_movie_controller.dart';

import 'package:movie_discovery_app/controllers/movie_detail_controller.dart';

import 'package:movie_discovery_app/screens/moviedetail/bluredcontainer.dart';
import 'package:movie_discovery_app/screens/moviedetail/bottomcontainer.dart';

import 'package:movie_discovery_app/screens/moviedetail/customappbar.dart';
import 'package:movie_discovery_app/screens/moviedetail/floatingbutton.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ScrollController scrollController = ScrollController();

  bool buttonVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 210, 159, 220),
        body: SizedBox(
            height: double.maxFinite,
            child: FutureBuilder(
                future: Future.wait([
                  Get.find<MovieDetailController>().setAndFetch(),
                  Get.find<ActorListController>().setAndFetch(),
                  Get.find<ImageFromMovieController>().setAndFetch(),
                ]),

                // Get.find<ImageFromMovieController>().setAndFetch(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Return a loading indicator or placeholder
                    return const Center(child: CircularProgressIndicator());
                  }
                  // else if (snapshot.hasError) {
                  //   // Handle error state
                  //   return Center(child: Text('Error: ${snapshot.error}'));
                  // }
                  else {
                    return Stack(
                      children: [
                        CustomAppBar(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            isButtonVisisble: buttonVisible),
                        NotificationListener<DraggableScrollableNotification>(
                          onNotification: (notification) {
                            if (notification.extent == 0.52) {
                              Get.find<FloatingButtomControllor>().visible();
                            } else {
                              Get.find<FloatingButtomControllor>().invisible();
                            }

                            return false;
                          },
                          child: DraggableScrollableSheet(
                            controller: null,
                            initialChildSize: 0.52,
                            minChildSize: 0.52,
                            maxChildSize: 0.86,
                            builder: (context, scrollController) {
                              return Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50))),
                                  child: GetBuilder<MovieDetailController>(
                                      builder: (controller) {
                                    return ListView(
                                        controller: scrollController,
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.09,
                                            ),
                                            child: Text(
                                              controller.movieDetail.movieName,
                                              style: GoogleFonts.actor(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.09,
                                            ),
                                            child: Text(
                                              controller.movieDetail.geners,
                                              style: GoogleFonts.lato(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: const Color.fromARGB(
                                                      131, 0, 0, 0)),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.09,
                                            ),
                                            child: Text(
                                              "${controller.movieDetail.runtime}  min",
                                              style: const TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color.fromARGB(
                                                      125, 0, 0, 0)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: screenHeight * 0.02,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.09,
                                            ),
                                            child: Text(controller
                                                .movieDetail.overview),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Container(
                                            color: Colors.transparent,
                                            margin: EdgeInsets.all(
                                                screenWidth * 0.02),
                                            width: screenWidth,
                                            height: screenHeight * 0.2,
                                            child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                screenWidth *
                                                                    0.02),
                                                    width: screenWidth * 0.4,
                                                    child: Card(
                                                      elevation: 3,
                                                      shadowColor: Colors.black,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20.0), // Adjust the radius as needed
                                                      ),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          image:
                                                              DecorationImage(
                                                            image: NetworkImage(
                                                              "https://image.tmdb.org/t/p/original${Get.find<ImageFromMovieController>().movieImage[index].filePath}",
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                              },
                                              itemCount: Get.find<
                                                      ImageFromMovieController>()
                                                  .movieImage
                                                  .length,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.09,
                                            ),
                                            child: Text(Get.find<
                                                    ActorListController>()
                                                .getActorNamesSeparatedByCommas()),
                                          ),
                                        ]);
                                  }));
                            },
                          ),
                        ),
                        FloatingButton(
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                        BottomContainer(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                        BluredContainer(
                            screenWidth: screenWidth,
                            screenHeight: screenHeight),
                      ],
                    );
                  }
                })));
  }
}
