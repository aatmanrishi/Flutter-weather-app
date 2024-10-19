import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apiServices/controller.dart';

class TopPart extends StatelessWidget {
  const TopPart({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.find<WeatherController>();

    // Use a fallback for null values
    final String iconUrl = weatherController.weather['icon']?.isNotEmpty == true
        ? weatherController.weather['icon'][0]
        : 'default_icon_url';

    final String temperature =
        weatherController.weather['temperature']?.toString() ?? 'N/A';
    final String weatherDescription =
        (weatherController.weather['weatherDescription']?.isNotEmpty == true)
            ? weatherController.weather['weatherDescription'][0]
            : 'Unknown Weather';

    final String date = weatherController.weather['date'] ?? '';
    final String day = weatherController.weather['day'] ?? '';
    final String year = weatherController.weather['year'] ?? '';

    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(iconUrl),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$temperature°C',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  wordSpacing: 2,
                ),
              ),
              Container(
                width: 100,
                child: Text(
                  weatherDescription,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    wordSpacing: 2,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(), // Add a spacer to push the right column to the end
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  day,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    wordSpacing: 2,
                  ),
                  textAlign: TextAlign.end,
                ),
                Text(
                  date, // This seems redundant; adjust as needed
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    wordSpacing: 2,
                  ),
                  textAlign: TextAlign.end,
                ),
                Text(
                  year,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    wordSpacing: 2,
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
