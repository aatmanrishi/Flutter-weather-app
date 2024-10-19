import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/UI/Components/diffParams.dart';
import 'package:weather_app/UI/Components/location.dart';
import 'package:weather_app/UI/Components/topPart.dart';
import 'package:weather_app/apiServices/controller.dart';

class Parameters extends StatelessWidget {
  const Parameters({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.find<WeatherController>();
    return Expanded(
        child: Column(
      children: [
        TopPart(),
        SizedBox(height: 30),
        locationArea(),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Diffparams(
              icon: Icons.wind_power_outlined,
              type: 'WIND SPEED', // Change type to reflect speed
              data: (weatherController.weather["windSpeed"] != null
                  ? (weatherController.weather["windSpeed"] * 2.23694)
                          .toStringAsFixed(2) +
                      ' mph'
                  : 'N/A'), // Handle null case
              crossAxisAlignment: CrossAxisAlignment.start,
              textAlign: TextAlign.left,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
            Diffparams(
              icon: Icons.water_drop_outlined,
              type: 'Humidity',
              data: weatherController.weather["humidity"].toString(),
              crossAxisAlignment: CrossAxisAlignment.end,
              textAlign: TextAlign.right,
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Diffparams(
              icon: Icons.visibility,
              type: 'Visibility',
              data: weatherController.weather["visibility"].toString(),
              crossAxisAlignment: CrossAxisAlignment.start,
              textAlign: TextAlign.right,
              mainAxisAlignment: MainAxisAlignment.start,
              fontSize: 20,
              iconSize: 40,
            ),
            Diffparams(
              icon: Icons.directions,
              type: 'WIND DIRECTION',
              data: weatherController.weather["wdirection"].toString(),
              crossAxisAlignment: CrossAxisAlignment.end,
              textAlign: TextAlign.right,
              mainAxisAlignment: MainAxisAlignment.end,
              fontSize: 20,
              iconSize: 40,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Diffparams(
              icon: Icons.water_outlined,
              type: 'PRECIPITATION',
              data: weatherController.weather["precip"].toString(),
              crossAxisAlignment: CrossAxisAlignment.start,
              textAlign: TextAlign.right,
              mainAxisAlignment: MainAxisAlignment.start,
              fontSize: 20,
              iconSize: 40,
            ),
            Diffparams(
              icon: Icons.cloud_outlined,
              type: 'CLOUD COVER',
              data: weatherController.weather["cloudCover"].toString(),
              crossAxisAlignment: CrossAxisAlignment.end,
              textAlign: TextAlign.right,
              mainAxisAlignment: MainAxisAlignment.end,
              fontSize: 20,
              iconSize: 40,
            ),
          ],
        )
      ],
    ));
  }
}
