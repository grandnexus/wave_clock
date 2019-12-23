import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wave_clock/wave.dart';

void main() {
  testWidgets('[Widget] Wave', (WidgetTester tester) async {
    // Create key.
    const Key key = Key('wave');

    // Initialize [Size].
    const Size size = Size(300, 600);

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const Wave(
        key: key,
        size: size,
        xOffset: 120,
        yOffset: -10,
        color: Colors.blue,
        duration: 3,
        opacity: 0.8,
      ),
    );

    // Trigger a frame.
    await tester.pump();

    // Create the Finders.
    final Finder waveFinderByKey = find.byKey(key);
    final Finder waveFinderByType = find.byType(Wave);

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(waveFinderByKey, findsOneWidget);
    expect(waveFinderByType, findsOneWidget);

    // Verify if the tickers were disposed.
    tester.verifyTickersWereDisposed();
  });
}
