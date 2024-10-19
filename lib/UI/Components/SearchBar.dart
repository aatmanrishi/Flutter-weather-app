import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/apiServices/controller.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.find<WeatherController>();
    return Padding(
        padding: EdgeInsets.fromLTRB(8, 15, 8, 5),
        child: TextFormField(
          controller: weatherController.textEditingController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.location_on_outlined,
                color: Colors.white,
                size: 30,
              ),
              // hintText: 'LOCATION',
              // hintStyle: TextDStyle(
              //     letterSpacing: 2,
              //     color: Colors.white,
              //     fontSize: 18),
              filled: true,
              fillColor: Colors.black.withOpacity(0.25),
              prefixIcon: IconButton(
                  onPressed: () async {
                    await weatherController.searchLocationWeather();
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(255, 134, 134, 134),
                      width: 0.75))),
        ));
  }
}
