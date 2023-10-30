import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../models/moviedetail.dart';

class MovieDetailController extends GetxController {
  static final dio = Dio();

  final MovieDetail _detail = MovieDetail(
      geners: '',
      movieName: '',
      overview: '',
      posterPath: '',
      runtime: 0,
      rating: 0);

  MovieDetail get movieDetail => _detail;

  Future<void> setAndFetch(int movieId) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$movieId?language=en-US',
        options: Options(
          method: 'GET',
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OTk3ZWI5YWZlMWJmNjg5MTc1MzkxOTAwOTJjYzc4OSIsInN1YiI6IjY1MzdmMDljOTQ2MzE4MDBhZDk0OGM3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q_iIILzIlhWUDSnKyY7ds1ny1Jnk9rYW8DPxz9sPBes',
          },
        ),
      );

      final movieData = response.data;
      List<Map<String, dynamic>> genreList =
          List<Map<String, dynamic>>.from(movieData['genres']);

      List<String> genreNames =
          genreList.map((genre) => genre['name'].toString()).toList();

      String allGenres = genreNames.join(', ');

      _detail.geners = allGenres;
      _detail.movieName = movieData['original_title'];
      _detail.overview = movieData['overview'];
      _detail.posterPath = movieData['poster_path'];
      _detail.runtime = movieData['runtime'];
      _detail.rating = movieData['vote_average'];

      update();
    } catch (e) {
      // Handle the API request failure here.
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
