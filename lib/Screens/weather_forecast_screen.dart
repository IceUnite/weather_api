import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_api/api/weather_api.dart';
import 'package:weather_api/models/weather_forecast_daily.dart';
import 'package:weather_api/widjets/city_view.dart';
import 'package:weather_api/widjets/detail_view,dart.dart';
import 'package:weather_api/widjets/temp_view.dart';
import 'package:weather_api/widjets/weather_list_view.dart';
import 'package:weather_api/Screens/city_screen.dart';

class WeatherForeCastScreen extends StatefulWidget {

  final locationWeather;

  WeatherForeCastScreen({this.locationWeather});

  @override
  WeatherForeCastScreenState createState() => WeatherForeCastScreenState();
}

class WeatherForeCastScreenState extends State<WeatherForeCastScreen> {
  Future<WeatherForecast>? forecastObject;

   String? _cityName = 'Moscow';
 // String _cityName;

  @override

  void initState() {
    super.initState();
    if (widget.locationWeather != null){
      print('1');
      forecastObject = WeatherApi().fetchWeatherForecast();
    }

    /*forecastObject.then((weather) {
      print(weather.list?[0].weather?[0].main);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('Ice_Product'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();

            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.location_city_rounded),
            onPressed: () async {
              var tappedName = await Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null){
              setState(() {
                _cityName = tappedName;
                print('$_cityName');
                forecastObject = WeatherApi().fetchWeatherForecast(cityName: _cityName);
              });
              }
            }
            )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
              child: FutureBuilder<WeatherForecast?>(
                  future: forecastObject,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: <Widget>[
                          SizedBox(height: 50),
                          Center(child: CityView(snapshot)),
                          SizedBox(height: 50),
                          Center(child: TempView(snapshot)),
                          SizedBox(height: 50),
                          DetailView(snapshot),
                          SizedBox(height: 50),
                          WeatherListView(snapshot),


                        ],
                      );
                    } else {
                      return Center(
                        child: SpinKitCircle(
                          color: Colors.cyanAccent,
                          size: 100.0,
                          //duration: const Duration(seconds: 10),
                        ),
                      );
                    }
                  }))
        ],
      ),
    );
  }
}
