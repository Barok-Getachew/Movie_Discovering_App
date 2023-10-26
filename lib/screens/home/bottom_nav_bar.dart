import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_discovery_app/controllers/movie_controllers.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  BottomNavController bottomNavController = Get.find();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GNav(
      padding: EdgeInsets.all(size.width * 0.02),
      color: Colors.grey,
      tabBorderRadius: size.height * 0.05,
      tabBackgroundColor: Colors.black12,
      gap: size.width * 0.02,
      style: GnavStyle.google,
      hoverColor: Colors.black12,
      onTabChange: (index) => bottomNavController.onTab(index),
      tabs: const [
        GButton(
          icon: Icons.feed,
          text: "Feed",
        ),
        GButton(
          icon: Icons.bookmark_border,
          text: "Favotire",
        ),
        GButton(
          icon: Icons.person_outline_outlined,
          text: "Profile",
        )
      ],
    );
  }
}

