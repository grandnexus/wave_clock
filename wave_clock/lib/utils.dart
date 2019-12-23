import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

// Get the weather icon based on current hour and weather condition.
IconData getWeatherIcon(int currentHour, String weatherCondition) {
  final timeType = getTimeType(currentHour);
  final weatherWithTimeType = '$timeType-$weatherCondition';

  switch (weatherWithTimeType) {
    case 'day-cloudy':
      return WeatherIcons.day_cloudy;
      break;
    case 'night-cloudy':
      return WeatherIcons.night_cloudy;
      break;
    case 'day-foggy':
      return WeatherIcons.day_fog;
      break;
    case 'night-foggy':
      return WeatherIcons.night_fog;
      break;
    case 'day-rainy':
      return WeatherIcons.day_rain;
      break;
    case 'night-rainy':
      return WeatherIcons.night_rain;
      break;
    case 'day-snowy':
      return WeatherIcons.day_snow;
      break;
    case 'night-snowy':
      return WeatherIcons.night_snow;
      break;
    case 'day-sunny':
      return WeatherIcons.day_sunny;
      break;
    case 'night-sunny':
      return WeatherIcons.night_clear;
      break;
    case 'day-thunderstorm':
      return WeatherIcons.day_thunderstorm;
      break;
    case 'night-thunderstorm':
      return WeatherIcons.night_thunderstorm;
      break;
    default:
      return WeatherIcons.lunar_eclipse;
      break;
  }
}

// Get the time type in day or night time.
String getTimeType(int currentHour) =>
    currentHour > 5 && currentHour < 19 ? 'day' : 'night';

// Get the [DigitColumn] color.
Color getDigitColumnColor(int hour, bool isDarkMode, Color color) => isDarkMode
    ? color.withOpacity(0.95)
    : hour <= 17 ? Colors.blue[400].withOpacity(0.95) : color.withOpacity(0.95);

// Get the [Text] color.
Color getTextColor(int hour, bool isDarkMode, Color color) =>
    isDarkMode ? color : hour <= 17 ? Colors.black : color;

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
