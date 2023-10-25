import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movie_discovery_app/helpers/init_dependency.dart';

void main() {
  runApp(const MovieDiscoverApp());
}

class MovieDiscoverApp extends StatelessWidget {
  const MovieDiscoverApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitDep(),
      title: 'Movie Descovery App',
    
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily: "PlusJakartaSans"),
            bodyMedium: TextStyle(fontFamily: "PlusJakartaSans"),
            bodySmall: TextStyle(fontFamily: "PlusJakartaSans")),
        useMaterial3: true,
      ),
      // home: const DetailScreen(),
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
    Future.delayed(const Duration(seconds: 2),(){
    //  navigate to home screen using getx
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
