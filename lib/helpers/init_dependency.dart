import 'package:get/get.dart';
import 'package:movie_discovery_app/controllers/actorlistcontroller.dart';
import 'package:movie_discovery_app/controllers/floatingbuttoncontroller.dart';
import 'package:movie_discovery_app/controllers/image_from_movie_controller.dart';
import 'package:movie_discovery_app/controllers/movie_detail_controller.dart';

import '../controllers/movie_controllers.dart';

//  this class is used to inject dependancy

class InitDep extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieController());
    Get.lazyPut(() => FloatingButtomControllor());
    Get.lazyPut(() => MovieDetailController());
    Get.lazyPut(() => ImageFromMovieController());
    Get.lazyPut(() => ActorListController());
  }
}
