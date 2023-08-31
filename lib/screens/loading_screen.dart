import 'package:clima_weatherapp/screens/location_screen.dart';
import 'package:clima_weatherapp/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//todo 10 : pakai const api key
//TODO 9 : pakai import dart:convert

//TODo 2: import geolocator

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //Todo 3 : bikin void getLocation()
//Todo 4 : buka android manifest izin ini : <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" /> <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

  //Todo 5 : buat initsate, declare getLocation();
  double? latitude;
  double? longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

//todo 6: buat getLocation() async{ } kemudian di declare dari locatoin.dart, Location location = Location();
  //Todo 13 : Declare netorkhelper

  void getLocationData() async {
    //Todo 14 ; gabungin getlocation dan get data jadi getLocationData

    //TODO 10; pisahin ini ke networking.dart sampe decodeData;

    //Todo 25 : pindahin yang ada di getlocation ke class weathermodel
    //Todo 15 : buat Navigatorpush

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
