import 'Coord.dart';

/// id : 360997
/// name : "Giza Governorate"
/// coord : {"lat":29.9745,"lon":31.1064}
/// country : "EG"
/// population : 0
/// timezone : 7200
/// sunrise : 1706330925
/// sunset : 1706369240

class City {
  City({
      int? id, 
      String? name, 
      Coord? coord, 
      String? country, 
      int? population, 
      int? timezone, 
      int? sunrise, 
      int? sunset,}){
    _id = id;
    _name = name;
    _coord = coord;
    _country = country;
    _population = population;
    _timezone = timezone;
    _sunrise = sunrise;
    _sunset = sunset;
}

  City.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    _country = json['country'];
    _population = json['population'];
    _timezone = json['timezone'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }
  int? _id;
  String? _name;
  Coord? _coord;
  String? _country;
  int? _population;
  int? _timezone;
  int? _sunrise;
  int? _sunset;
City copyWith({  int? id,
  String? name,
  Coord? coord,
  String? country,
  int? population,
  int? timezone,
  int? sunrise,
  int? sunset,
}) => City(  id: id ?? _id,
  name: name ?? _name,
  coord: coord ?? _coord,
  country: country ?? _country,
  population: population ?? _population,
  timezone: timezone ?? _timezone,
  sunrise: sunrise ?? _sunrise,
  sunset: sunset ?? _sunset,
);
  int? get id => _id;
  String? get name => _name;
  Coord? get coord => _coord;
  String? get country => _country;
  int? get population => _population;
  int? get timezone => _timezone;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    if (_coord != null) {
      map['coord'] = _coord?.toJson();
    }
    map['country'] = _country;
    map['population'] = _population;
    map['timezone'] = _timezone;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    return map;
  }

}