import 'package:flutter/material.dart';
import 'package:weather_api/models/weather_forecast_daily.dart';
import '../utilities/forecast_util.dart';

Widget WeatherCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data!.list;
  var DayOfWeek = '';
  DateTime date = DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormateDate(date);
  DayOfWeek = fullDate.split(',')[0]; //WeekDay
  var MinTemp = forecastList[index].temp.min.toStringAsFixed(0);
  var Icon = forecastList[index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            DayOfWeek,
            style: TextStyle(fontSize: 22, color: Colors.white),),),

      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('$MinTemp °C', style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),),
                  ),
                  Image.network(
                    Icon,
                    scale: 1.2,
                    //color: Colors.white,
                  )
                ],
              )
            ],
          )
        ],
      )
    ],
  );
}