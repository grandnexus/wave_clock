import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

import 'package:wave_clock/wave_time.dart';

void main() {
  group('[Utils] WaveTime', () {
    final WaveTime now = WaveTime();
    final DateTime dateTime = DateTime.now();

    test('[Value] year', () {
      expect(now.year, dateTime.year);
      expect(now.year.runtimeType, equals(int));
    });
    test('[Value] month', () {
      expect(now.month, dateTime.month);
      expect(now.month.runtimeType, equals(int));
    });
    test('[Value] day', () {
      expect(now.day, dateTime.day);
      expect(now.day.runtimeType, equals(int));
    });
    test('[Value] monthInFull', () {
      expect(now.monthInFull, DateFormat('MMMM').format(dateTime));
      expect(now.monthInFull.runtimeType, equals(String));
    });
    test('[Value] weekday', () {
      expect(now.weekday, DateFormat('EEEE').format(dateTime));
      expect(now.weekday.runtimeType, equals(String));
    });
    test('[Value] hourIn12Hour', () {
      expect(
        now.hourIn12Hour,
        now.timeDigitsIn12Hour[0] * 10 + now.timeDigitsIn12Hour[1],
      );
      expect(now.hourIn12Hour.runtimeType, equals(int));
    });
    test('[Value] hourTensIn12Hour', () {
      expect(now.hourTensIn12Hour, now.timeDigitsIn12Hour[0]);
      expect(now.hourTensIn12Hour.runtimeType, equals(int));
    });
    test('[Value] hourOnesIn12Hour', () {
      expect(now.hourOnesIn12Hour, now.timeDigitsIn12Hour[1]);
      expect(now.hourOnesIn12Hour.runtimeType, equals(int));
    });
    test('[Value] hour', () {
      expect(
        now.hour,
        now.timeDigitsIn24Hour[0] * 10 + now.timeDigitsIn24Hour[1],
      );
      expect(now.hour.runtimeType, equals(int));
    });
    test('[Value] hourTens', () {
      expect(now.hourTens, now.timeDigitsIn24Hour[0]);
      expect(now.hourTens.runtimeType, equals(int));
    });
    test('[Value] hourOnes', () {
      expect(now.hourOnes, now.timeDigitsIn24Hour[1]);
      expect(now.hourOnes.runtimeType, equals(int));
    });
    test('[Value] minute', () {
      expect(
        now.minute,
        now.timeDigitsIn24Hour[2] * 10 + now.timeDigitsIn24Hour[3],
      );
      expect(now.minute.runtimeType, equals(int));
    });
    test('[Value] minuteTens', () {
      expect(now.minuteTens, now.timeDigitsIn24Hour[2]);
      expect(now.minuteTens.runtimeType, equals(int));
    });
    test('[Value] minuteOnes', () {
      expect(now.minuteOnes, now.timeDigitsIn24Hour[3]);
      expect(now.minuteOnes.runtimeType, equals(int));
    });
    test('[Value] second', () {
      expect(
        now.second,
        now.timeDigitsIn24Hour[4] * 10 + now.timeDigitsIn24Hour[5],
      );
      expect(now.second.runtimeType, equals(int));
    });
    test('[Value] secondTens', () {
      expect(now.secondTens, now.timeDigitsIn24Hour[4]);
      expect(now.secondTens.runtimeType, equals(int));
    });
    test('[Value] secondOnes', () {
      expect(now.secondOnes, now.timeDigitsIn24Hour[5]);
      expect(now.secondOnes.runtimeType, equals(int));
    });
  });
}
