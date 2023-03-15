import 'dart:ffi';

import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Future<void> GetCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        print("User Denied Permission");
      } else {
        LocationPermission asked = await Geolocator.requestPermission();
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        longitude = position.longitude;
        latitude = position.latitude;
      }
    } catch (e) {
      print(e);
    }
  }
}
