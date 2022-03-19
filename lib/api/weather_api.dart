import 'dart:convert';
import 'package:weather_api/models/weather_forecast_daily.dart';
import 'package:weather_api/utilities/constats.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';
import 'package:weather_api/utilities/geolocation.dart';

class WeatherApi {
  Future<WeatherForecast>? fetchWeatherForecast({String? cityName}) async {
    var parameters = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
      //'lat': Location.Shirota.toString(),
      //'lon': Location.Dolgota.toString(),
    };
    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMEN,
         Constants.WEATHER_FORECAST_PATH, parameters);

    log('request ${uri.toString()}');

    var response = await http.get(uri);

    print('11111111');
    
    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Error');
    }
    }
  }








// class WeatherApi {
//   Future<WeatherForecast>? fetchWeatherForecast(
//   {String? cityName, bool? isCity}) async {
//
//     Location geolocation = Location();
//     await geolocation.getCurrentLocation();
//     Map<String, dynamic>? parameters;
//     if (isCity == true){
//       var queryParameters = {
//         'APPID': Constants.WEATHER_APP_ID,
//         'units': 'metric',
//         'q': cityName,
//       };
//       parameters = queryParameters;
//     }
//     else {
//       var queryParameters = {
//         'APPID': Constants.WEATHER_APP_ID,
//         'units': 'metric',
//         'lat': geolocation.Shirota.toString(),
//         'lon': geolocation.Dolgota.toString(),
//       };
//       parameters = queryParameters;
//     }
//
//     var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMEN,
//         Constants.WEATHER_FORECAST_PATH, parameters);
//     log('reauest: (uri.toString()}');
//     //log('reauest: $(uri.toString()}');
//
//     var response = await http.get(uri);
//     print('response: (response.body}');
//     //print('response: $(response&.body}');
//
//     if (response.statusCode == 200) {
//       return WeatherForecast.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Error response");
//     }
//   }
// }
