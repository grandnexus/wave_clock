import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:flutter_clock_helper/customizer.dart';
import 'package:flutter_clock_helper/model.dart';

import 'package:wave_clock/clock.dart';

void main() {
  // A temporary measure until Platform supports web and TargetPlatform supports
  // macOS.
  if (!kIsWeb && Platform.isMacOS) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  SystemChrome.setEnabledSystemUIOverlays([]);

  // This creates a clock that enables you to customize it.
  //
  // The [ClockCustomizer] takes in a [ClockBuilder] that consists of:
  //  - A clock widget (in this case, [DigitalClock])
  //  - A model (provided to you by [ClockModel])
  // For more information, see the flutter_clock_helper package.
  //
  // Your job is to edit [DigitalClock], or replace it with your
  // own clock widget. (Look in digital_clock.dart for more details!)
  runApp(ClockCustomizer((ClockModel model) => WaveClockApp(model)));
}

// This widget is the root of your application.
class WaveClockApp extends StatefulWidget {
  const WaveClockApp(this.model);

  final ClockModel model;

  @override
  _WaveClockAppState createState() => _WaveClockAppState();
}

class _WaveClockAppState extends State<WaveClockApp> {
  bool is24HourFormat = false;
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    widget.model.addListener(_updateModel);
    _updateModel();
  }

  @override
  void dispose() {
    widget.model.removeListener(_updateModel);
    widget.model.dispose();
    super.dispose();
  }

  void _updateModel() {
    setState(() {
      // Cause the clock to rebuild when the model changes.
      is24HourFormat = widget.model.is24HourFormat;
    });
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Theme.of(context).brightness,
        primarySwatch: Colors.brown,
        primaryColorDark: Colors.white,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(builder: (context, constraints) {
          return Clock(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            is24HourFormat: is24HourFormat,
            isDarkMode: isDarkMode,
          );
        }),
      ),
    );
  }
}
