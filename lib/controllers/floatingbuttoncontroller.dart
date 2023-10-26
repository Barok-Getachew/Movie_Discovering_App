import 'package:get/get.dart';

class FloatingButtomControllor extends GetxController {
  bool _isVisible = true;

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
