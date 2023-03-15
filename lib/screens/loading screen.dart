import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void GetLocation() async {
    Location location = Location();
    await location.GetCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void GetData() async {
    http.Response response = await http.get(Uri.parse(
        'https://samples.openweathermap.org/data/2.5/weather?q=London&mode=html&appid=b6907d289e10d714a6e88b30761fae22'));
    print(response.body);
  }

  @override
  void initState() {
    super.initState();
    print("initState Called");
    GetLocation();
    GetData();
  }

  @override
  void deactivate() {
    print("deadctivate called");
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    GetData();
    return Scaffold();
  }
}
