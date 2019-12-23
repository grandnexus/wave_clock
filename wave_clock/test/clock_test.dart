import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wave_clock/wave_time.dart';
import 'package:wave_clock/clock.dart';

void main() {
  testWidgets('[Widget] Clock', (WidgetTester tester) async {
    // Create key.
    final Key key = Key('clock');

    // Get current time.
    final WaveTime now = WaveTime();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Clock(
            key: key,
            width: 800,
            height: 300,
            color: Colors.black,
            location: 'Singapore, SG',
            lowTemperature: '27.0°C',
            highTemperature: '30.0°C',
            weatherCondition: 'sunny',
            is24HourFormat: true,
            isDarkMode: false,
          ),
        ),
      ),
    );

    // Trigger a frame.
    await tester.pump();

    // Create the finders.
    final finderByType = find.byType(Clock);
    final finderByKey = find.byKey(key);

    // Use the `findsOneWidget` matcher provided by flutter_test
    expect(finderByType, findsOneWidget);
    expect(finderByKey, findsOneWidget);

    // Verify that [Clock] contains [WaveTime] and [ClockModel].
    expect(find.text('${now.hourTens}'), findsWidgets);
    expect(find.text('${now.hourOnes}'), findsWidgets);
    expect(find.text('${now.minuteTens}'), findsWidgets);
    expect(find.text('${now.minuteOnes}'), findsWidgets);
    expect(find.text('${now.secondTens}'), findsWidgets);
    expect(find.text('${now.secondOnes}'), findsWidgets);
    expect(
      find.text('${now.weekday}, ${now.day} ${now.monthInFull} ${now.year}'),
      findsWidgets,
    );
    expect(
      find.text('Singapore, SG'),
      findsWidgets,
    );
    expect(
      find.text('Low: 27.0°C'),
      findsWidgets,
    );
    expect(
      find.text('High: 30.0°C'),
      findsWidgets,
    );
  });
}
