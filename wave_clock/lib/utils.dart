import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

// Weather model for holding icon, text and wave colors based on weather condition.
class Weather {
  Weather({
    this.icon,
    this.textColor = Colors.black,
    this.waveColor = Colors.blue,
  });
  IconData icon;
  Color textColor;
  Color waveColor;
}

// Get the weather icon and color based on current hour and weather condition.
Weather getWeather(int currentHour, String weatherCondition,
    {isDarkMode = false}) {
  final timeType = getTimeType(currentHour);
  final weatherWithTimeType = '$timeType-$weatherCondition';
  final textColor = getTextColor(isDarkMode);

  switch (weatherWithTimeType) {
    case 'day-cloudy':
      return Weather(
        icon: WeatherIcons.day_cloudy,
        textColor: textColor,
        waveColor: Colors.lightBlue[300],
      );
      break;
    case 'night-cloudy':
      return Weather(
        icon: WeatherIcons.night_cloudy,
        textColor: textColor,
        waveColor: Colors.blue[800],
      );
      break;
    case 'day-foggy':
      return Weather(
        icon: WeatherIcons.day_fog,
        textColor: textColor,
        waveColor: Colors.grey,
      );
      break;
    case 'night-foggy':
      return Weather(
        icon: WeatherIcons.night_fog,
        textColor: textColor,
        waveColor: Colors.grey[600],
      );
      break;
    case 'day-rainy':
      return Weather(
        icon: WeatherIcons.day_rain,
        textColor: textColor,
        waveColor: Colors.blue,
      );

      break;
    case 'night-rainy':
      return Weather(
        icon: WeatherIcons.night_rain,
        textColor: textColor,
        waveColor: Colors.blue[700],
      );
      break;
    case 'day-snowy':
      return Weather(
        icon: WeatherIcons.day_snow,
        textColor: textColor,
        waveColor: Color.fromRGBO(232, 236, 242, 1.0),
      );
      break;
    case 'night-snowy':
      return Weather(
        icon: WeatherIcons.night_snow,
        textColor: textColor,
        waveColor: Color.fromRGBO(78, 95, 110, 1.0),
      );
      break;
    case 'day-sunny':
      return Weather(
        icon: WeatherIcons.day_sunny,
        textColor: textColor,
        waveColor: Colors.yellow[500],
      );
      break;
    case 'night-sunny':
      return Weather(
        icon: WeatherIcons.night_clear,
        textColor: textColor,
        waveColor: Colors.orange,
      );
      break;
    case 'day-thunderstorm':
      return Weather(
        icon: WeatherIcons.day_thunderstorm,
        textColor: textColor,
        waveColor: Color.fromRGBO(94, 92, 132, 0.9),
      );
      break;
    case 'night-thunderstorm':
      return Weather(
        icon: WeatherIcons.night_thunderstorm,
        textColor: textColor,
        waveColor: Color.fromRGBO(94, 92, 132, 0.9),
      );
      break;
    case 'day-windy':
      return Weather(
        icon: WeatherIcons.day_windy,
        textColor: textColor,
        waveColor: Colors.cyan,
      );
      break;
    case 'night-windy':
      return Weather(
        icon: WeatherIcons.night_cloudy_windy,
        textColor: textColor,
        waveColor: Colors.cyan[600],
      );
      break;
    default:
      return Weather(
        icon: WeatherIcons.lunar_eclipse,
        textColor: textColor,
        waveColor: Colors.pink,
      );
      break;
  }
}

// Get the time type in day or night time.
String getTimeType(int currentHour) =>
    currentHour > 5 && currentHour < 19 ? 'day' : 'night';

// Get the [DigitColumn] color.
Color getDigitColumnColor(int currentHour, bool isDarkMode, Color color) =>
    isDarkMode
        ? Colors.white.withOpacity(0.8)
        : currentHour <= 17
            ? Colors.blue[400].withOpacity(0.95)
            : Colors.white.withOpacity(0.8);

// Get the [Text] color.
Color getTextColor(bool isDarkMode) => isDarkMode ? Colors.white : Colors.black;

// Calculate the wave height based on current hour.
double calculateWaveHeight(int currentHour, Size size) =>
    size.height -
    ((currentHour != 0 ? currentHour : 0) * size.height / 24) -
    35;

// Format the time market in 12-hour or 24-hour format.
String formatTimeMarker(int marker, bool is24HourFormat) => is24HourFormat
    ? '$marker'.padLeft(2, '0').padRight(4, '0')
    : marker > 12
        ? '${marker - 12}PM'.padLeft(2, '0')
        : '${marker}AM'.padLeft(2, '0');
