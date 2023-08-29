import 'package:flutter/material.dart';
import 'package:clima_weatherapp/services/location.dart';
import 'package:http/http.dart';

//TODo 2: import geolocator

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Todo 3 : bikin void getLocation()
//Todo 4 : buka android manifest izin ini : <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" /> <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

  //Todo 5 : buat initsate, declare getLocation();
  @override
  void initState() {
    super.initState();
    getLocation();
  }
//todo 6: buat getLocation() async{ } kemudian di declare dari locatoin.dart, Location location = Location();
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }
void getData
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
