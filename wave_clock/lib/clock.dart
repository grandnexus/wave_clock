import 'dart:async';

import 'package:flutter/material.dart';

import 'package:wave_clock/wave_time.dart';
import 'package:wave_clock/wave.dart';
import 'package:wave_clock/digit_column.dart';
import 'package:wave_clock/clock_marker.dart';

class Clock extends StatefulWidget {
  const Clock({
    Key key,
    this.width,
    this.height,
    this.is24HourFormat,
    this.isDarkMode,
  }) : super(key: key);

  final double width;
  final double height;
  final bool is24HourFormat;
  final bool isDarkMode;

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer _timer;
  WaveTime _now = WaveTime();

  // Tick the clock.
  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _now = WaveTime();
      });
    });
    super.initState();
  }

  double _calculateWidthHeight(Size size) =>
      size.height - (_now.hour * size.height / 24) - 35;

  @override
  Widget build(BuildContext context) {
    final Size size = Size(widget.width, widget.height);
    return Stack(
      children: <Widget>[
        ClockMarker(
          is24HourFormat: widget.is24HourFormat,
          isDarkMode: widget.isDarkMode,
        ),
        Wave(
          size: size,
          xOffset: 0,
          yOffset: _calculateWidthHeight(size),
          color: widget.isDarkMode ? Colors.blue : Colors.pink,
          duration: 5,
          opacity: 1.0,
        ),
        Container(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Columns for the clock
                  DigitColumn(
                    digit: widget.is24HourFormat
                        ? '${_now.hourTens}'
                        : '${_now.hourTensIn12Hour}',
                    color: Colors.blue.withOpacity(0.8),
                  ),
                  DigitColumn(
                    digit: widget.is24HourFormat
                        ? '${_now.hourOnes}'
                        : '${_now.hourOnesIn12Hour}',
                    color: Colors.lightBlue.withOpacity(0.8),
                  ),
                  DigitColumn(
                    digit: '${_now.minuteTens}',
                    color: Colors.lightGreen.withOpacity(0.8),
                  ),
                  DigitColumn(
                    digit: '${_now.minuteOnes}',
                    color: Colors.lightGreen.withOpacity(0.8),
                  ),
                  DigitColumn(
                    digit: '${_now.secondTens}',
                    color: Colors.pink.withOpacity(0.8),
                  ),
                  DigitColumn(
                    digit: '${_now.secondOnes}',
                    color: Colors.pinkAccent.withOpacity(0.8),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
