import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:wave_clock/wave_clipper.dart';

void main() {
  group('[Widget] WaveClipper', () {
    // Initialize Flutter binding.
    final TestWidgetsFlutterBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
    if (binding is LiveTestWidgetsFlutterBinding)
      binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    test('Creates wave list with offset coordinates on clip path', () {
      final Size size = Size(300, 600);
      final AnimationController animationController = AnimationController(
        vsync: const TestVSync(),
        duration: Duration(seconds: 3),
      );
      final List<Offset> waveList = [];
      animationController.addListener(() {
        waveList.clear();
        for (int i = -2 - 90; i <= size.width.toInt() + 2; i++) {
          waveList.add(
            Offset(
                i.toDouble() + 90,
                sin((animationController.value * 360 - i) % 360 * pi / 180.0) *
                        15 +
                    50 -
                    20),
          );
        }
      });
      animationController.repeat();
      animationController.value = 0.5;

      final WaveClipper waveClipper =
          WaveClipper(animationController.value, waveList);

      expect(waveClipper.animation, 0.5);
      expect(waveClipper.waveOffsets.length, isNonZero);
      expect(waveClipper.runtimeType, equals(WaveClipper));
    });
  });
}
