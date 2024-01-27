// import 'package:flutter/cupertino.dart';
// import 'package:location/location.dart';
//
// class LocationProvider with ChangeNotifier{
//   double lat = 29.9745;
//   double long = 31.1064;
//
//   Future<void> requestLocation() async {
//     Location location = Location();
//
//     bool serviceEnabled;
//     PermissionStatus permissionGranted;
//     LocationData locationData;
//
//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         return;
//       }
//     }
//
//     permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//
//     locationData = await location.getLocation();
//     setLatLong(locationData.latitude, locationData.longitude);
//     notifyListeners();
//   }
//
//   void setLatLong(double? lat, double? long){
//     this.lat = lat ?? 29.9745;
//     this.long = long ?? 31.1064;
//   }
// }