import 'package:flutter_test/flutter_test.dart';
import 'package:movie_discovery_app/controllers/floatingbuttoncontroller.dart';

void main() {
  late FloatingButtomControllor buttomControllor;

  setUp(() {
    buttomControllor = FloatingButtomControllor();
  });
  group("Floating button controller test", () {
    test("If the isVisible is initially true ", () {
      expect(buttomControllor.isVisible, true);
    });

    test("Visible function work corectly", () {
      buttomControllor.visible();
      final isVisible = buttomControllor.isVisible;
      expect(isVisible, true);
    });
    test("inVisible function work corectly", () {
      buttomControllor.invisible();

      expect(buttomControllor.isVisible, false);
    });
  });
}
