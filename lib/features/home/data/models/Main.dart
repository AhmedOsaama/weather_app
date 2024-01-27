/// temp : 17.33
/// feels_like : 16.11
/// temp_min : 15.47
/// temp_max : 17.33
/// pressure : 1022
/// sea_level : 1022
/// grnd_level : 1017
/// humidity : 38
/// temp_kf : 1.86

class Main {
  Main({
      double? temp, 
      double? feelsLike, 
      double? tempMin, 
      double? tempMax, 
      int? pressure, 
      int? seaLevel, 
      int? grndLevel, 
      int? humidity, 
      double? tempKf,}){
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _seaLevel = seaLevel;
    _grndLevel = grndLevel;
    _humidity = humidity;
    _tempKf = tempKf;
}

  Main.fromJson(dynamic json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _seaLevel = json['sea_level'];
    _grndLevel = json['grnd_level'];
    _humidity = json['humidity'];
    _tempKf = json['temp_kf'];
  }
  double? _temp;
  double? _feelsLike;
  double? _tempMin;
  double? _tempMax;
  int? _pressure;
  int? _seaLevel;
  int? _grndLevel;
  int? _humidity;
  double? _tempKf;
Main copyWith({  double? temp,
  double? feelsLike,
  double? tempMin,
  double? tempMax,
  int? pressure,
  int? seaLevel,
  int? grndLevel,
  int? humidity,
  double? tempKf,
}) => Main(  temp: temp ?? _temp,
  feelsLike: feelsLike ?? _feelsLike,
  tempMin: tempMin ?? _tempMin,
  tempMax: tempMax ?? _tempMax,
  pressure: pressure ?? _pressure,
  seaLevel: seaLevel ?? _seaLevel,
  grndLevel: grndLevel ?? _grndLevel,
  humidity: humidity ?? _humidity,
  tempKf: tempKf ?? _tempKf,
);
  double? get temp => _temp;
  double? get feelsLike => _feelsLike;
  double? get tempMin => _tempMin;
  double? get tempMax => _tempMax;
  int? get pressure => _pressure;
  int? get seaLevel => _seaLevel;
  int? get grndLevel => _grndLevel;
  int? get humidity => _humidity;
  double? get tempKf => _tempKf;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    map['pressure'] = _pressure;
    map['sea_level'] = _seaLevel;
    map['grnd_level'] = _grndLevel;
    map['humidity'] = _humidity;
    map['temp_kf'] = _tempKf;
    return map;
  }

}