import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = "d87cc74e42d6ac7743dbefe2a9891139";

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.GetCurrentLocation();
    setState(() {
      latitude = location.latitude;
      longitude = location.longitude;
    });
  }

  @override
  void deactivate() {
    print("deactivate called");
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Latitude: $latitude, Longitude: $longitude',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
