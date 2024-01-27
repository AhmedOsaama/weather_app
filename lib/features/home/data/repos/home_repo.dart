import '../models/WeatherModel.dart';

abstract class HomeRepo{
  Future<WeatherModel?> fetchFiveDayWeather(String lat, String long, String unit);
}