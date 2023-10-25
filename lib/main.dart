import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_discovery_app/helpers/init_dependency.dart';
import 'package:movie_discovery_app/screens/home/home_screen.dart';

void main() {
  runApp(const MovieDiscoverApp());
}

class MovieDiscoverApp extends StatelessWidget {
  const MovieDiscoverApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie Descovery App',
      initialBinding: InitDep(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}

// this widget will be displayed only
//when the app starts for 2 seconds

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      //  navigate to home screen using getx
      Get.to(const HomeScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text(
        "Welcome!",
      ),
    ));
  }
}
