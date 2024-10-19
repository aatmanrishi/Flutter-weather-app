import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

Future<String?> fetchLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Get placemarks from coordinates
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      // Prioritize locality for city/town, otherwise fall back to subLocality or name
      String? locationName =
          placemarks[0].locality;
      print(locationName); // Print the location name for debugging
      return locationName; // Return the name of the city/town/village
    } else {
      print('No placemarks found');
      return null; // No placemarks found
    }
  } catch (e) {
    print('Error fetching location: $e');
    return null; // Handle error, return null
  }
}
