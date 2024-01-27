/// lat : 29.9745
/// lon : 31.1064

class Coord {
  Coord({
      double? lat, 
      double? lon,}){
    _lat = lat;
    _lon = lon;
}

  Coord.fromJson(dynamic json) {
    _lat = json['lat'];
    _lon = json['lon'];
  }
  double? _lat;
  double? _lon;
Coord copyWith({  double? lat,
  double? lon,
}) => Coord(  lat: lat ?? _lat,
  lon: lon ?? _lon,
);
  double? get lat => _lat;
  double? get lon => _lon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lat'] = _lat;
    map['lon'] = _lon;
    return map;
  }

}