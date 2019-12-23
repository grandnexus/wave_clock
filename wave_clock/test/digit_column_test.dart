import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wave_clock/digit_column.dart';

void main() {
  testWidgets('[Widget] DigitColumn', (WidgetTester tester) async {
    // Create key.
    final Key key1 = Key('digit_column1');
    final Key key2 = Key('digit_column2');

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Row(
          children: <Widget>[
            DigitColumn(
              key: key1,
              digit: '1',
              color: Colors.blue,
            ),
            DigitColumn(
              key: key2,
              digit: '2',
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );

    // Trigger a frame.
    await tester.pump();

    // Create the finders.
    final finderByType = find.byType(DigitColumn);
    final finderByKey1 = find.byKey(key1);
    final finderByKey2 = find.byKey(key2);

    // Use the `findsOneWidget` matcher provided by flutter_test
    expect(finderByType, findsNWidgets(2));
    expect(finderByKey1, findsOneWidget);
    expect(finderByKey2, findsOneWidget);

    // Verify that [DigitColumn] contains 1, 2 and not 3.
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsNothing);
  });
}
