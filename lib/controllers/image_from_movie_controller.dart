import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:movie_discovery_app/models/moviimage.dart';

class ImageFromMovieController extends GetxController {
  static final dio = Dio();

  final List<MovieImage> _movieImage = [];

  List<MovieImage> get movieImage => _movieImage;
  Future<void> setAndFetch(int movieId) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$movieId/images',
        options: Options(
          method: 'GET',
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OTk3ZWI5YWZlMWJmNjg5MTc1MzkxOTAwOTJjYzc4OSIsInN1YiI6IjY1MzdmMDljOTQ2MzE4MDBhZDk0OGM3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q_iIILzIlhWUDSnKyY7ds1ny1Jnk9rYW8DPxz9sPBes',
          },
        ),
      );
      _movieImage.clear();
      for (int i = 0; i < response.data['backdrops'].length; i++) {
        var movie = response.data['backdrops'][i];
        _movieImage.add(MovieImage(movie['file_path']));
      }
      update();
      
    } catch (e) {
      Get.snackbar("Error",
          "An error occurred while fetching movie images"); // Show an error message to the user
    }
  }


}
