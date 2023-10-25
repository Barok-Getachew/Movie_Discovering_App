import 'package:get/get.dart';

class MovieController extends GetxController {}
























class FloatingButtomControllor extends GetxController {
  bool _isVisible = false;

  bool get isVisible => _isVisible;

  void visible() {
    _isVisible = true;
    update();
  }

  void invisible() {
    _isVisible = false;
    update();
  }
}
