import 'package:intl/intl.dart' show DateFormat;

/// Utility class to access values as time digits.
class WaveTime {
  List<int> timeDigitsIn12Hour;
  List<int> timeDigitsIn24Hour;

  // Get the current time.
  final DateTime now = DateTime.now();

  String getFormattedTime(String dateFormat) =>
      DateFormat(dateFormat).format(now).replaceAll(':', '');

  List<int> splitDigits(String timeString) =>
      timeString.split('').map((digit) => int.parse(digit)).toList();

  WaveTime() {
    // Get the current time in String without ':' in 12-hour format.
    final String currentTimeIn12Hour = getFormattedTime('hhmmss');

    // Get the current time in String without ':' in 24-hour format.
    final String currentTimeIn24Hour = getFormattedTime('HHmmss');

    // Split the String current time into parts.
    timeDigitsIn12Hour = splitDigits(currentTimeIn12Hour);
    timeDigitsIn24Hour = splitDigits(currentTimeIn24Hour);
  }

  int get hourIn12Hour =>
      timeDigitsIn12Hour[0] * 10 +
      timeDigitsIn12Hour[1]; // get hour in 12-hour format.
  int get hourTensIn12Hour =>
      timeDigitsIn12Hour[0]; // Get hour tens digit in 12-hour format.
  int get hourOnesIn12Hour =>
      timeDigitsIn12Hour[1]; // Get hour ones digit in 12-hour format.

  int get hour =>
      timeDigitsIn24Hour[0] * 10 +
      timeDigitsIn24Hour[1]; // get hour in 24-hour format.
  int get hourTens =>
      timeDigitsIn24Hour[0]; // Get hour tens digit in 24-hour format.
  int get hourOnes =>
      timeDigitsIn24Hour[1]; // Get hour ones digit in 24-hour format.
  int get minute =>
      timeDigitsIn24Hour[2] * 10 +
      timeDigitsIn24Hour[3]; // get minute in 24-hour format.
  int get minuteTens =>
      timeDigitsIn24Hour[2]; // Get minute tens digit in 24-hour format.
  int get minuteOnes =>
      timeDigitsIn24Hour[3]; // Get minute ones digit in 24-hour format.
  int get second =>
      timeDigitsIn24Hour[4] * 10 +
      timeDigitsIn24Hour[5]; // get minute in 24-hour format.
  int get secondTens =>
      timeDigitsIn24Hour[4]; // Get second tens digit in 24-hour format.
  int get secondOnes =>
      timeDigitsIn24Hour[5]; // Get second ones digit in 24-hour format.
}
