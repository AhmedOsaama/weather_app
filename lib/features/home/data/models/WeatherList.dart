import 'Main.dart';
import 'Weather.dart';
import 'Clouds.dart';
import 'Wind.dart';
import 'Sys.dart';

/// dt : 1706378400
/// main : {"temp":17.33,"feels_like":16.11,"temp_min":15.47,"temp_max":17.33,"pressure":1022,"sea_level":1022,"grnd_level":1017,"humidity":38,"temp_kf":1.86}
/// weather : [{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}]
/// clouds : {"all":17}
/// wind : {"speed":4.87,"deg":321,"gust":7.01}
/// visibility : 10000
/// pop : 0
/// sys : {"pod":"n"}
/// dt_txt : "2024-01-27 18:00:00"

class WeatherList {
  WeatherList({
      int? dt, 
      Main? main, 
      List<Weather>? weather, 
      Clouds? clouds, 
      Wind? wind, 
      int? visibility, 
      num? pop,
      Sys? sys, 
      String? dtTxt,}){
    _dt = dt;
    _main = main;
    _weather = weather;
    _clouds = clouds;
    _wind = wind;
    _visibility = visibility;
    _pop = pop;
    _sys = sys;
    _dtTxt = dtTxt;
}

  WeatherList.fromJson(dynamic json) {
    _dt = json['dt'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _visibility = json['visibility'];
    _pop = json['pop'];
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _dtTxt = json['dt_txt'];
  }
  int? _dt;
  Main? _main;
  List<Weather>? _weather;
  Clouds? _clouds;
  Wind? _wind;
  int? _visibility;
  num? _pop;
  Sys? _sys;
  String? _dtTxt;
WeatherList copyWith({  int? dt,
  Main? main,
  List<Weather>? weather,
  Clouds? clouds,
  Wind? wind,
  int? visibility,
  int? pop,
  Sys? sys,
  String? dtTxt,
}) => WeatherList(  dt: dt ?? _dt,
  main: main ?? _main,
  weather: weather ?? _weather,
  clouds: clouds ?? _clouds,
  wind: wind ?? _wind,
  visibility: visibility ?? _visibility,
  pop: pop ?? _pop,
  sys: sys ?? _sys,
  dtTxt: dtTxt ?? _dtTxt,
);
  int? get dt => _dt;
  Main? get main => _main;
  List<Weather>? get weather => _weather;
  Clouds? get clouds => _clouds;
  Wind? get wind => _wind;
  int? get visibility => _visibility;
  num? get pop => _pop;
  Sys? get sys => _sys;
  String? get dtTxt => _dtTxt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['dt'] = _dt;
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    if (_clouds != null) {
      map['clouds'] = _clouds?.toJson();
    }
    if (_wind != null) {
      map['wind'] = _wind?.toJson();
    }
    map['visibility'] = _visibility;
    map['pop'] = _pop;
    if (_sys != null) {
      map['sys'] = _sys?.toJson();
    }
    map['dt_txt'] = _dtTxt;
    return map;
  }

}