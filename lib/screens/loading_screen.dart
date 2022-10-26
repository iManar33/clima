import 'package:clima3_flutter/services/weather.dart';
import 'package:clima3_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

// LocationPermission? permission;
  void getLocationData() async {
    print(2);

   // WeatherModel weatherModel =WeatherModel(); // we write this when we want to use the object more than once

   var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData ,
      );
    }));

    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     // Permissions are denied, next time you could try
    //     // requesting permissions again (this is also where
    //     // Android's shouldShowRequestPermissionRationale
    //     // returned true. According to Android guidelines
    //     // your App should show an explanatory UI now.
    //     return Future.error('Location permissions are denied');
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
