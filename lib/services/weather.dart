import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apikey = '913e4bfbc6499a3dab3a3bf4074340f9';
const URL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future getCityWeather(cityName) async{
    var url = '$URL?q=$cityName&appid=$apikey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
  Future getLocationWeather() async{
    Location loc = Location();
    await loc.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$URL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apikey&units=metric');

    var weatherDate = await networkHelper.getData();
    return weatherDate;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '☃';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
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
