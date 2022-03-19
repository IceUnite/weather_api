import 'package:geolocator/geolocator.dart';

class Location {
  double? Shirota;
  double? Dolgota;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await
      Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low)
          .timeout(Duration(seconds: 5));
      Shirota = position.latitude; //Получаем Широту
      Dolgota = position.longitude; //Получаем Долготу
    } catch (e) {
      throw 'Something goes wrong: $e';
    }
  }
}
