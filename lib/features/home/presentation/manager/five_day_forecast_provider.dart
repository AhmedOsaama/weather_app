import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/features/home/data/repos/home_repo.dart';

import '../../data/models/WeatherList.dart';

class FiveDayForecastProvider with ChangeNotifier{
  final HomeRepo homeRepo;
  FiveDayForecastProvider(this.homeRepo);


  List<WeatherList> weatherList = [];

  Future<void> fetchFiveDayForecast(String lat, String long, String unit) async {
   var result = await homeRepo.fetchFiveDayWeather(lat, long, unit);
    if(result == null){

    }else{
      weatherList = result.weatherList!;
    }
    notifyListeners();
  }

}