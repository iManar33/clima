import 'package:clima3_flutter/services/location.dart';
import 'package:clima3_flutter/services/Networking.dart';
const String openWeatherMap = 'api.openweathermap.org';
const String apiKey = 'c192309e1b6975cd994e956e03b36922';

class WeatherModel {
  Future getCityWeather (String cityName) async{
    var url = Uri.https(openWeatherMap, '/data/2.5/weather',{
      'q': cityName,
      'appid': apiKey,
      'units': 'metric',
    });
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData =await networkHelper.getData();

    return weatherData;
  }

  Future getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    print('longitude : ${location.longitude} \n latitude : ${location.latitude}');
    var url = Uri.https(openWeatherMap, '/data/2.5/weather', {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'appid': apiKey,
      'units': 'metric',
    });
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
