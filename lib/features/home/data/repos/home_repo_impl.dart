import 'package:dio/dio.dart';
import 'package:weather_forecast/core/api_service.dart';
import 'package:weather_forecast/features/home/data/models/WeatherModel.dart';
import 'package:weather_forecast/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<WeatherModel?> fetchFiveDayWeather(String lat, String long, String unit) async {
    print("Fetching...");
    try{
    var data = await apiService.get(
        endPoint: '?lat=${lat}&lon=${long}&appid=f6b8b253f95d22ea06e8db2604eb413f&units=$unit');
    WeatherModel weatherModel = WeatherModel.fromJson(data);
    return weatherModel;
  }catch(e){
    if(e is DioException){
      print(e);
      return null;
    }
    print(e);
      return null;
  }
  }

}