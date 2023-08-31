import 'package:clima_weatherapp/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima_weatherapp/utilities/constants.dart';
import 'package:clima_weatherapp/services/weather.dart';

//TODO 21 : import services weather

class LocationScreen extends StatefulWidget {
  //TODO 16 : declare final locationWeather

  const LocationScreen({super.key, this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  //TODO 18 : declate int temp,condit,cityname di sini,
  //todo 22 : declare WeatherModel weather = WeatherModel();
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String weatherIcon;
  late String cityName;
  late String weatherMessage;

  //TODO 24 : bikin String WeatherMes

// TODO 23: ganti condition jadi string weatherIcon
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

//TODO 17: buat void UpdateUI yang cut di bawah
  void updateUI(dynamic weatherData) {
    setState(() {
      //Todo 29 : bikin if else biar klao error masi bagus.
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }
      var condition = weatherData['weather'][0]['id'];
      print(condition);
      cityName = weatherData['name'];
      print(cityName);
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      print(temperature);
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
    });
  }

  //Todo 19 : bikin double temp, kemudian temperature = temp to int

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    //TODO 28 : tambahkan var weatherdata = await lalu update IU
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CityScreen();
                        }),
                      );
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    //TODO 20: ganti 32º sama $temp
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '☀️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
