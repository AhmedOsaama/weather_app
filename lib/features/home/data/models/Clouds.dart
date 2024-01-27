/// all : 17

class Clouds {
  Clouds({
      int? all,}){
    _all = all;
}

  Clouds.fromJson(dynamic json) {
    _all = json['all'];
  }
  int? _all;
Clouds copyWith({  int? all,
}) => Clouds(  all: all ?? _all,
);
  int? get all => _all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = _all;
    return map;
  }

}