import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/apiServices/Model.dart';
import 'package:weather_app/apiServices/currentlocationFunction/getPermissions.dart';
import './Utitlity/weatherImG.dart';

class WeatherController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxMap weather = {}.obs;
  RxString slocation = ''.obs;
  RxString clocation = ''.obs;
  RxInt weatherCode = 0.obs;
  RxString weatherImagePath = ''.obs;
  static const apiKey = '08618dc8dd564981faebb4ce2a117759';
  RxString formattedDate = DateFormat('d MMMM').format(DateTime.now()).obs;
  RxString year = DateFormat('yyyy').format(DateTime.now()).obs;
  RxString todayDay = DateFormat('EEEE').format(DateTime.now()).obs;
  RxBool searchLoad = false.obs;
  @override
  void onInit() async {
    clocation.value = (await checkPermission())!;
    if (clocation.isNotEmpty) {
      print(clocation);
      await getWeather(apiKey, clocation.value);
    }
    super.onInit();
  }

  Future<void> getWeather(String apiKey, String slocation) async {
    var url =
        'https://api.weatherstack.com/current?access_key=$apiKey&query=$slocation';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        var modeledresult = WeatherModel.fromJson(result);

        weather.addAll({
          "temperature": modeledresult.current?.temperature,
          "query": modeledresult.request?.query,
          "name": modeledresult.location?.name,
          "country": modeledresult.location?.country,
          "region": modeledresult.location?.region,
          "weatherCode": modeledresult.current?.weatherCode,
          "weatherDescription": modeledresult.current?.weatherDescriptions,
          "humidity": modeledresult.current?.humidity,
          "pressure": modeledresult.current?.pressure,
          "visibility": modeledresult.current?.visibility,
          "wdirection": modeledresult.current?.windDir,
          "cloudCover": modeledresult.current?.cloudcover,
          "precip": modeledresult.current?.precip,
          "icon": modeledresult.current?.weatherIcons,
          "day": formattedDate.value,
          "date": todayDay.value,
          "year": year.value
        });
        weatherCode.value = modeledresult.current?.weatherCode ?? 0;
        weatherImagePath.value = imagePathMap[weatherCode.value]!;
        print(weatherImagePath);
        print(weather["temperature"]);
        print(weather["visibility"]);
        print(weather["wdirection"]);
        print(weather["cloudCover"]);
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> searchLocationWeather() async {
    searchLoad.value = true; // Use .value to set the RxBool
    String location = textEditingController.text.trim();

    if (location.isNotEmpty) {
      await getWeather(apiKey, location);

      // Add a delay of 5 seconds
      await Future.delayed(Duration(seconds: 5));

      searchLoad.value = false; // Use .value to set the RxBool
    } else {
      print("Please enter a valid location.");
      searchLoad.value =
          false; // Ensure loader is hidden if location is invalid
    }
  }
}
