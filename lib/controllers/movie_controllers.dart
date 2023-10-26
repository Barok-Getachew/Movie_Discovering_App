import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:movie_discovery_app/models/genre_model.dart';
import 'package:movie_discovery_app/models/movie_model.dart';

class MovieController extends GetxController {
  final String _apiKey = "9b5dbc93159c2ef9e36db001fb077013";
  final List<MovieModel> _recentMovies = []; // list of fetched movies
  final List<MovieModel> _popularMovies = []; // list of fetched movies

  final List<GenreModel> _genres = []; // map for Storing genres

  List<MovieModel> get recentMovies => _recentMovies;
  List<MovieModel> get popularMovies => _popularMovies;

  List<GenreModel> get genres => _genres;

  Future<void> fetchAndSetMovies() async {
    try {
      var recentMovieResponse = await Dio()
          .get("https://api.themoviedb.org/3/movie/upcoming?api_key=$_apiKey");
      var popularMovieResponse = await Dio()
          .get("https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");

      var genreResponse = await Dio().get(
          "https://api.themoviedb.org/3/genre/movie/list?api_key=$_apiKey");

      // print(response.data['results']);

      for (int i = 0; i < recentMovieResponse.data['results'].length; i++) {
        // iterating for storing each movie to _movies variable
        var movie = recentMovieResponse.data['results'][i];
        _recentMovies.add(
          MovieModel(
            adult: movie['adult'] as bool,
            backdroppath: movie['backdrop_path'] as String,
            genreids: movie['genre_ids'],
            id: movie['id'],
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

        for (int i = 0; i < popularMovieResponse.data['results'].length; i++) {
          // iterating for storing each movie to _movies variable
          var movie = popularMovieResponse.data['results'][i];
          _popularMovies.add(
            MovieModel(
              adult: movie['adult'] as bool,
              backdroppath: movie['backdrop_path'] as String,
              genreids: movie['genre_ids'],
              id: movie['id'],
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

          for (int i = 0; i < genreResponse.data['genres'].length; i++) {
            _genres.add(
              GenreModel(
                id: genreResponse.data['genres'][i]['id'],
                name: genreResponse.data['genres'][i]['name'],
              ),
            );
          }

          update();
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  // getting all genres as String
  String getGeners(List<dynamic>? genresList) {
    String genreTxt = '';
    for (int i = 0; i < genresList!.length; i++) {
      bool end = (i == genresList.length - 1);
      genreTxt +=
          genres.firstWhere((element) => element.id == genresList[i]).name;
      genreTxt += end ? "" : ", ";
    }
    return genreTxt;
  }
}

class BottomNavController extends GetxController {
  final RxInt _index = 0.obs;

  int get index => _index.value;

  void onTab(int index) {
    _index.value = index;
  }
}
