import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_icons/weather_icons.dart';

import 'package:wave_clock/weather.dart';

void main() {
  group('[Utils] Utils', () {
    test('[Class] Weather', () {
      final Weather weather = Weather(icon: WeatherIcons.day_sunny);
      expect(weather.icon, WeatherIcons.day_sunny);
      expect(weather.icon, isInstanceOf<IconData>());
      expect(weather.textColor, Colors.black);
      expect(weather.textColor, isInstanceOf<Color>());
      expect(weather.textColor.runtimeType, equals(Color));
      expect(weather.waveColor, Colors.blue);
      expect(weather.waveColor, isInstanceOf<MaterialColor>());
      expect(weather.waveColor.runtimeType, equals(MaterialColor));
    });
  });
}
