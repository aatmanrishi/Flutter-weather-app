import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/UI/Page/Home.dart';
import 'package:weather_app/apiServices/controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(WeatherController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final WeatherController weatherController = Get.find<WeatherController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
           theme: ThemeData(
        // Define primary swatch as a MaterialColor
        primarySwatch: Colors.deepPurple, 
        scaffoldBackgroundColor: Colors.white, // Default background color
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
