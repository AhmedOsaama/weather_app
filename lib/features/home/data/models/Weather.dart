/// id : 801
/// main : "Clouds"
/// description : "few clouds"
/// icon : "02n"

class Weather {
  Weather({
      int? id, 
      String? main, 
      String? description, 
      String? icon,}){
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
}

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }
  int? _id;
  String? _main;
  String? _description;
  String? _icon;
Weather copyWith({  int? id,
  String? main,
  String? description,
  String? icon,
}) => Weather(  id: id ?? _id,
  main: main ?? _main,
  description: description ?? _description,
  icon: icon ?? _icon,
);
  int? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }

}