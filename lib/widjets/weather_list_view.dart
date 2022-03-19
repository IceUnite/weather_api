import 'package:flutter/material.dart';
import 'package:weather_api/models/weather_forecast_daily.dart';
import 'package:weather_api/widjets/weather_card.dart';

class WeatherListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast?> snapshot;
  const WeatherListView(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text('Week Forecast'.toUpperCase(),style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        ),
        Container(
            height: 140,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8),
              itemCount: snapshot.data!.list!.length,
              itemBuilder: (context, index) => Container(
                decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(10),
                  color: Colors.black54,
                ),
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                child: WeatherCard(snapshot, index),
              ),
            )
        ),
      ],
    );
  }
}
