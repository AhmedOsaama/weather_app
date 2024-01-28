import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:weather_forecast/features/home/data/repos/home_repo.dart';

import '../../data/models/WeatherList.dart';

class FiveDayForecastProvider with ChangeNotifier{
  final HomeRepo homeRepo;
  FiveDayForecastProvider(this.homeRepo);


  List<WeatherList> weatherList = [];
  String cityName = "";

  Future<void> fetchFiveDayForecast() async {
    var locationData = await requestLocation();
    var result = await homeRepo.fetchFiveDayWeather(locationData!.latitude.toString(), locationData.longitude.toString(), "metric");
    if(result == null){
      print("Error: $result");
    }else{
      weatherList = result.weatherList!;
      cityName = result.city!.name!;
    }
    notifyListeners();
  }

  Future<LocationData?> requestLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    locationData = await location.getLocation();
    return locationData;
  }


}