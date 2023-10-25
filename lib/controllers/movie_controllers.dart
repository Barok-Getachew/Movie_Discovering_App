import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movie_discovery_app/models/movie_model.dart';

class MovieController extends GetxController {
  final String _apiKey = "9b5dbc93159c2ef9e36db001fb077013";
  final List<MovieModel> _movies = [];

  List<MovieModel> get movies => _movies;

  Future<void> fetchAndSet() async {
    try {
      var response = await Dio().get(
          "https://api.themoviedb.org/3/movie/popular?api_key=9b5dbc93159c2ef9e36db001fb077013");

      // print(response.data['results']);

      for (int i = 0; i < response.data['results'].length; i++) {
        var movie = response.data['results'][i];
        _movies.add(
          MovieModel(
            adult: movie['adult'] as bool,
            backdroppath: movie['backdrop_path'] as String,
            // genreids: movie['genre_ids'],
            // id: movie['id'],
            originallanguage: movie['original_language'] as String,
            originaltitle: movie['original_title'] as String,
            overview: movie['overview'] as String,
            popularity: movie["popularity"],
            posterpath: movie["poster_path"] as String,
            releasedate: movie['release_date'] as String,
            title: movie['title'] as String,
            // video: movie['video'] as bool,
            // voteaverage: movie['vote_average'],
            // votecount: movie['vote_count'],
          ),
        );
        update();
      }
    } catch (e) {
      print(e);
    }
    // print(_movies);
  }
}

class BottomNavController extends GetxController {
  final RxInt _index = 0.obs;

  int get index => _index.value;

  void onTab(int index) {
    _index.value = index;
  }
}
