import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_discovery_app/controllers/image_from_movie_controller.dart';

class ActorListView extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const ActorListView(
      {super.key, required this.screenWidth, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    Get.put(ImageFromMovieController());
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.all(screenWidth * 0.02),
      width: screenWidth,
      height: screenHeight * 0.2,
      child: GetBuilder<ImageFromMovieController>(builder: (controller) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                width: screenWidth * 0.4,
                child: Card(
                  elevation: 3,
                  shadowColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        20.0), // Adjust the radius as needed
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://image.tmdb.org/t/p/original${controller.movieImage[index].filePath}",
                          
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ));
                
          },
          itemCount: Get.find<ImageFromMovieController>().movieImage.length,
        );
      }),
    );
  }
}
