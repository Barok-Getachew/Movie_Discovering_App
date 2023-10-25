import 'package:get/get.dart';
import 'package:movie_discovery_app/controllers/movie_controllers.dart';

//  this class is used to inject dependancy

class InitDep extends Bindings {
  @override
  void dependencies() {
    Get.put(MovieController());
    Get.put(BottomNavController());
  }
}
