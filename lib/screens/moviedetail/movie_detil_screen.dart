import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_discovery_app/controllers/actorlistcontroller.dart';
import 'package:movie_discovery_app/controllers/floatingbuttoncontroller.dart';
import 'package:movie_discovery_app/controllers/image_from_movie_controller.dart';

import 'package:movie_discovery_app/controllers/movie_detail_controller.dart';
import 'package:movie_discovery_app/screens/moviedetail/actorlistview.dart';

import 'package:movie_discovery_app/screens/moviedetail/bluredcontainer.dart';
import 'package:movie_discovery_app/screens/moviedetail/bottomcontainer.dart';

import 'package:movie_discovery_app/screens/moviedetail/customappbar.dart';
import 'package:movie_discovery_app/screens/moviedetail/floatingbutton.dart';

class DetailScreen extends StatefulWidget {
  final int movieID;
  const DetailScreen({super.key, required this.movieID});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ScrollController scrollController = ScrollController();

  bool buttonVisible = false;

  @override
  Widget build(BuildContext context) {
    Get.put(MovieDetailController());
    Get.lazyPut(() => ActorListController());
    Get.lazyPut(() => ImageFromMovieController());

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SizedBox(
            height: double.maxFinite,
            child: FutureBuilder(
                future: Future.wait([
                  Get.find<MovieDetailController>().setAndFetch(widget.movieID),
                  Get.find<ActorListController>().setAndFetch(widget.movieID),
                  Get.find<ImageFromMovieController>()
                      .setAndFetch(widget.movieID),
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
                                              style: const TextStyle(
                                                  fontFamily: 'ArgentumSans',
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
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
                                              "runtime: ${controller.movieDetail.runtime}  min",
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
                                          ActorListView(
                                            screenHeight: screenHeight,
                                            screenWidth: screenWidth,
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
