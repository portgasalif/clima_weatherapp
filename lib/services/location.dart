import 'package:geolocator/geolocator.dart';

//todo 7 : bikin class Location, dan void getCurrentLocation() async{} dengan properti latitude dan longitude
class Location {
  double? latitude;
  double? longitude;

//todo 8 : buat try catchnya Position position = await Geolocator.getCurrentPosition( desiredAccuracy: LocationAccuracy.low);
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
