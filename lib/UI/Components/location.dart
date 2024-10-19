import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../apiServices/controller.dart';

class locationArea extends StatelessWidget {
  const locationArea({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.find<WeatherController>();
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.share_location, color: Colors.white, size: 60),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  weatherController.weather['name'] ?? 'Unknown Location',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  (weatherController.weather['region']?.toUpperCase() ??
                      'UNKNOWN REGION'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    wordSpacing: 2,
                  ),
                  textAlign: TextAlign.end,
                  // textDirection: TextAlign.left,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
