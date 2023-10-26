import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ActorListController extends GetxController {
  static final dio = Dio();
  static const url = 'https://api.themoviedb.org/3/movie/299054?language=en-US';
  final List<Actor> _actors = [];

  List<Actor> get actorName => _actors;
  bool _dataFetched = false;

  Future<void> setAndFetch(int movieId) async {
    try {
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/$movieId/credits?language=en-US',
        options: Options(
          method: 'GET',
          headers: {
            'Authorization':
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OTk3ZWI5YWZlMWJmNjg5MTc1MzkxOTAwOTJjYzc4OSIsInN1YiI6IjY1MzdmMDljOTQ2MzE4MDBhZDk0OGM3NSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.q_iIILzIlhWUDSnKyY7ds1ny1Jnk9rYW8DPxz9sPBes',
          },
        ),
      );

      for (int i = 0; i < response.data['cast'].length; i++) {
        var actor = response.data['cast'][i];

        _actors.add(Actor(name: actor['name']));
      }

      _dataFetched = true;
      update();
    } catch (e) {
      Get.snackbar("Error",
          "An error occurred while fetching movie images"); // Show an error message to the user
    }
  }

  String getActorNamesSeparatedByCommas() {
    final actorNames = _actors.map((actor) => actor.name).join(', ');

    _actors.clear();

    return actorNames;
  }
}

class Actor {
  String name;
  Actor({required this.name});
}
