import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/weather_forecast_daily.dart';
import '../utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast?> snapshot;
  const DetailView(this.snapshot);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var pressure = (forecastList![0].pressure)! * 0.75;
    int hum = (forecastList[0].humidity)!;
    var speed = (forecastList[0].speed);
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Util.GetItem(FontAwesomeIcons.thermometerThreeQuarters, pressure.round(),'mm Hg'),
          Util.GetItem(FontAwesomeIcons.cloudRain, hum, '%'),
          Util.GetDoubleItem(FontAwesomeIcons.wind, speed,'m/s')

        ],
      ),
    );
  }
}
