import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/UI/Components/Parameters.dart';
import 'package:weather_app/UI/Components/SearchBar.dart';
import 'package:weather_app/apiServices/controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.find<WeatherController>();

    return SafeArea(
      child: Scaffold(
        body: Obx(() {
          // Check if the weatherImagePath is empty
          if (weatherController.weatherImagePath.value.isEmpty) {
            return Center(
                child: Center(
              child: Image.asset('assets/images/loadergif.gif'),
            ));
          } else {
            // Check if searchLoad is true
            if (weatherController.searchLoad.value) {
              return Center(
                  child: Image.asset(
                'assets/images/searchinganimtiaon.gif',
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                // fit: BoxFit.cover,
              ));
            } else {
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage(weatherController.weatherImagePath.value),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.95,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black45.withOpacity(0.4),
                          Colors.black,
                        ],
                        stops: [0.09, 1.0],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomSearchBar(),
                        Parameters(),
                      ],
                    ),
                  ),
                ),
              );
            }
          }
        }),
      ),
    );
  }
}
