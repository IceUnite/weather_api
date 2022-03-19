import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_api/Screens/weather_forecast_screen.dart';
import 'package:weather_api/api/weather_api.dart';
class GeoLocationScreen extends StatefulWidget {
  const GeoLocationScreen({Key? key}) : super(key: key);

  @override
  _GeoLocationScreenState createState() => _GeoLocationScreenState();
}

class _GeoLocationScreenState extends State<GeoLocationScreen> {
  void getDataLocation() async {
    var weatherInfo = await WeatherApi().fetchWeatherForecast();

    if (weatherInfo == null) {
      print('WeatherInfo is Null');
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherForeCastScreen(locationWeather: weatherInfo);
    }));
  }
  @override
  void initState(){
    super.initState();
    getDataLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.black, size: 100,),
      ),
    );
  }
}
