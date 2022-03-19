import 'package:flutter/material.dart';
import 'Screens/weather_forecast_screen.dart';
import 'package:weather_api/Screens/geolocation_Screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: WeatherForeCastScreen()
    );
  }
}

