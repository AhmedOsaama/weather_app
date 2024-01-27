/// pod : "n"

class Sys {
  Sys({
      String? pod,}){
    _pod = pod;
}

  Sys.fromJson(dynamic json) {
    _pod = json['pod'];
  }
  String? _pod;
Sys copyWith({  String? pod,
}) => Sys(  pod: pod ?? _pod,
);
  String? get pod => _pod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pod'] = _pod;
    return map;
  }

}