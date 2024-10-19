import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/apiServices/currentlocationFunction/getlocatoin.dart';

Future<String?> checkPermission() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return null; // Return null if location services are not enabled
  }

  LocationPermission permission = await Geolocator.checkPermission();

  // Request permission until granted
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission(); // Request permission
  }

  if (permission == LocationPermission.deniedForever) {
    Fluttertoast.showToast(msg: "Location permission is permanently denied.");
    return null; // Stop if permission is permanently denied
  }

  // If permission is granted, get the current location
  return await fetchLocation(); // Fetch and return the location
}
