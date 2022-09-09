import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '5842acaa2e1410059b4e24ca809896a4';
const open_weather_map = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> get_weather_city(String city_name) async {
    var url1 = '$open_weather_map?q=$city_name&appid=$apiKey&units=metric';
    NetworkHelper N2 = NetworkHelper(url1);

    var data_collected = await N2.getData();

    return data_collected;
  }

  Future<dynamic> getLocationWeather() async {
    Location L1 = Location();
    await L1.getCurrentLocation();

    //latitude = L1.latitude;
    //longitude = L1.longitude;

    NetworkHelper N1 = NetworkHelper(
        '$open_weather_map?lat=${L1.latitude}&lon=${L1.longitude}&appid=$apiKey&units=metric');

    var dataCollected = await N1.getData();

    return dataCollected;
  }

  String getWeatherIcon(int condition) {
    var dt = DateTime.now();
    String? phase;
    if (dt.hour > 18 || dt.hour < 6) {
      phase = 'night';
    } else {
      phase = 'day';
    }

    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
