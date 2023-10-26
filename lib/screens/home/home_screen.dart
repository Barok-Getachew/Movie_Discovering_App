import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_discovery_app/controllers/movie_controllers.dart';
import 'package:movie_discovery_app/screens/home/bottom_nav_bar.dart';

import 'feeds_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieController movieController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 0;
  final List<Widget> _widgets = [
    const FeedsWidget(),
    const Center(
      child: Text("favorite"),
    ),
    const Center(
      child: Text("Profile"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.12),
        child: BottomNavBar(),
      ),
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: () async {
          await movieController.fetchAndSetMovies();
        },
        child: FutureBuilder(
            future: movieController.fetchAndSetMovies(),
            builder: (ctx, snapshot) {
              return snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : Obx(() => _widgets[Get.find<BottomNavController>().index]);
            },
          ),
        ),
      ),
    );
  }
}
