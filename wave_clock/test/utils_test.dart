import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:wave_clock/weather.dart';
import 'package:wave_clock/utils.dart';

void main() {
  group('[Utils] Utils', () {
    test('[Function] getWeather', () {
      final Weather weather = getWeather(10, 'sunny');
      expect(weather.icon, WeatherIcons.day_sunny);
      expect(weather.icon, isInstanceOf<IconData>());
      expect(weather.textColor, Colors.black);
      expect(weather.textColor, isInstanceOf<Color>());
      expect(weather.textColor.runtimeType, equals(Color));
      expect(weather.waveColor, Colors.yellow[500]);
      expect(weather.waveColor.runtimeType, equals(Color));
    });
    test('[Function] getTimeType', () {
      final String timeType = getTimeType(10);
      expect(timeType, 'day');
      expect(timeType.runtimeType, equals(String));
    });
    test('[Function] getDigitColumnColor', () {
      final Color color = getDigitColumnColor(10, false, Colors.white);
      expect(color, Colors.blue[400].withOpacity(0.95));
      expect(color.runtimeType, equals(Color));
    });
    test('[Function] getTextColor', () {
      final Color color = getTextColor(false);
      expect(color, Colors.black);
      expect(color, isInstanceOf<Color>());
      expect(color.runtimeType, equals(Color));
    });
    test('[Function] calculateWaveHeight', () {
      const Size size = Size(100, 200);
      final double waveHeight = calculateWaveHeight(10, size);
      expect(waveHeight, 81.66666666666667);
      expect(waveHeight.runtimeType, equals(double));
    });
    test('[Function] formatTimeMarker', () {
      final String timeMarker = formatTimeMarker(10, true);
      expect(timeMarker, '1000');
      expect(timeMarker.runtimeType, equals(String));
    });
  });
}
