import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wave_clock/clock_marker.dart';
import 'package:wave_clock/utils.dart';

void main() {
  testWidgets('[Widget] ClockMarker', (WidgetTester tester) async {
    // Create key.
    final Key key = Key('clock_marker');

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Row(
          children: <Widget>[
            ClockMarker(
              key: key,
              is24HourFormat: true,
              isDarkMode: true,
            ),
          ],
        ),
      ),
    );

    // Trigger a frame.
    await tester.pump();

    // Create the finders.
    final finderByType = find.byType(ClockMarker);
    final finderByKey = find.byKey(key);

    // Use the `findsOneWidget` matcher provided by flutter_test
    expect(finderByType, findsOneWidget);
    expect(finderByKey, findsOneWidget);

    // Verify that [ClockMarker] contains from 00 to 25.
    for (var i = 0; i < 25; i++) {
      expect(find.text(formatTimeMarker(i, true)), findsOneWidget);
    }
  });
}
