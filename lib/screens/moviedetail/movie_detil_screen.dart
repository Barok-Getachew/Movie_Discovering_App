import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_discovery_app/controllers/floatingbuttoncontroller.dart';

import 'package:movie_discovery_app/screens/moviedetail/bluredcontainer.dart';
import 'package:movie_discovery_app/screens/moviedetail/bottomcontainer.dart';

import 'package:movie_discovery_app/screens/moviedetail/customappbar.dart';
import 'package:movie_discovery_app/screens/moviedetail/floatingbutton.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  ScrollController scrollController = ScrollController();

  static const longString = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor hendrerit sapien a congue. Nunc id nulla eget libero efficitur euismod. Nulla facilisi. Aliquam vehicula arcu id tincidunt. Vestibulum auctor turpis id diam eleifend auctor. Nulla facilisi. In consectetur nisi et risus fermentum, vel aliquet velit tincidunt. Integer vel leo in purus euismod tincidunt. Nulla rhoncus odio eu sapien vehicula, id dapibus nunc dignissim. Integer vel tortor euismod, volutpat odio in, volutpat turpis. Proin id risus sed ex feugiat viverra vel id quam. Fusce viverra diam in cursus dapibus.

Quisque mattis velit nec justo rhoncus, vel condimentum justo convallis. Maecenas nec tortor ut nunc laoreet efficitur. Sed non urna sit amet urna volutpat rhoncus. Suspendisse at magna eu turpis interdum vehicula. Sed viverra venenatis dui, ac condimentum elit luctus non. Vivamus gravida tincidunt ex, eu tincidunt justo posuere eget. Morbi non justo non nisi varius volutpat. Nunc a sollicitudin turpis. Phasellus id nisi non justo blandit volutpat.

Pellentesque euismod felis sit amet efficitur. Sed ut tortor neque. Fusce vel tincidunt elit. Proin non turpis lacinia, euismod metus id, convallis est. Suspendisse facilisis sem at tortor luctus vestibulum. Nullam et ante vel odio ultricies posuere. Nullam rhoncus nisi in nisl tincidunt, in dignissim erat laoreet. Sed id tincidunt dolor. Sed nec sem sed justo facilisis convallis.

Phasellus ultrices urna sed ante malesuada fringilla. Etiam sit amet sapien in felis laoreet iaculis. Vivamus vel urna eu metus congue elementum. Praesent at lorem eu ipsum tincidunt volutpat eu ac nunc. Quisque in odio ac libero lacinia tristique. Vestibulum posuere quis erat eu congue. Nullam tincidunt libero vitae tincidunt feugiat. Sed in eros varius, ultrices metus eu, feugiat mi. Nam ac justo id est mattis venenatis. Aliquam sit amet eros ut augue convallis auctor. Fusce quis erat et turpis vehicula ullamcorper.

Duis volutpat sapien quis dolor congue, a sollicitudin augue lacinia. Nullam at magna ut nisl bibendum dictum. Vestibulum in nisi at libero tincidunt vulputate. Donec in semper lectus. Sed eget turpis nec libero ullamcorper egestas. Curabitur nec augue a justo eleifend cursus. Nulla eu lectus eu turpis dignissim dictum. Curabitur suscipit, mi vel suscipit dictum, justo metus varius urna, nec malesuada orci odio quis ligula.
''';
  bool buttonVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 159, 220),
      body: SizedBox(
        height: double.maxFinite,
        child: Stack(
          children: [
            CustomAppBar(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                isButtonVisisble: buttonVisible),
            MediaQuery(
              data: MediaQuery.of(context),
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  if (notification.extent <= 0.52) {
                    Get.find<FloatingButtomControllor>().visible();
                  } else {
                    Get.find<FloatingButtomControllor>().invisible();
                  }

                  return false;
                },
                child: DraggableScrollableSheet(
                  controller: null,
                  initialChildSize: 0.52,
                  minChildSize: 0.52,
                  maxChildSize: 0.86,
                  builder: (context, scrollController) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.09),
                        child: ListView(
                          controller: scrollController,
                          children: [
                            const Text(
                              "Jokkr",
                              style: TextStyle(
                                  fontSize: 36, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "cinema, Drama, thriller",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(131, 0, 0, 0)),
                            ),
                            const Text(
                              "Runtime:2hr 2min",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(125, 0, 0, 0)),
                            ),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                            const Text(longString),
                            const Text('Title'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            FloatingButton(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            BottomContainer(
                screenWidth: screenWidth, screenHeight: screenHeight),
            BluredContainer(
                screenWidth: screenWidth, screenHeight: screenHeight),
          ],
        ),
      ),
    );
  }
}
