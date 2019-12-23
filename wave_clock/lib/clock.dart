import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wave_clock/utils.dart';

import 'package:wave_clock/wave_time.dart';
import 'package:wave_clock/wave.dart';
import 'package:wave_clock/digit_column.dart';
import 'package:wave_clock/clock_marker.dart';

import 'package:weather_icons/weather_icons.dart';

/// [Clock] is the main clock widget which holds all the related widgets.
class Clock extends StatefulWidget {
  const Clock({
    Key key,
    @required this.width,
    @required this.height,
    this.color = Colors.white70,
    this.location = "",
    this.lowTemperature = "",
    this.highTemperature = "",
    this.weatherCondition = "",
    this.is24HourFormat = false,
    this.isDarkMode = false,
  })  : assert(width != null),
        assert(height != null),
        super(key: key);

  final double width;
  final double height;
  final Color color;
  final String location;
  final String lowTemperature;
  final String highTemperature;
  final String weatherCondition;
  final bool is24HourFormat;
  final bool isDarkMode;

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Timer _timer;
  WaveTime _now = WaveTime();

  // Update the clock.
  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _now = WaveTime();
      });
    });
    super.initState();
  }

  // Dispose the periodic timer.
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = Size(widget.width, widget.height);
    return Stack(
      children: <Widget>[
        // Clock marker in the background.
        ClockMarker(
          is24HourFormat: widget.is24HourFormat,
          isDarkMode: widget.isDarkMode,
        ),
        // Animated wave in the background.
        Wave(
          size: size,
          xOffset: 0,
          yOffset: calculateWaveHeight(_now.hour, size),
          color: getWeather(
            _now.hour,
            widget.weatherCondition,
            isDarkMode: widget.isDarkMode,
          ).waveColor,
          duration: 5,
          opacity: 1.0,
        ),
        // Low and high temperatures with weather condition.
        Positioned(
          right: 20,
          top: 10,
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'Low: ${widget.lowTemperature}',
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: getWeather(
                            _now.hour,
                            widget.weatherCondition,
                            isDarkMode: widget.isDarkMode,
                          ).textColor,
                        ),
                  ),
                  Text(
                    'High: ${widget.highTemperature}',
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: getWeather(
                            _now.hour,
                            widget.weatherCondition,
                            isDarkMode: widget.isDarkMode,
                          ).textColor,
                        ),
                  ),
                ],
              ),
              IconButton(
                icon: BoxedIcon(
                  getWeather(
                    _now.hour,
                    widget.weatherCondition,
                    isDarkMode: widget.isDarkMode,
                  ).icon,
                  color: getWeather(
                    _now.hour,
                    widget.weatherCondition,
                    isDarkMode: widget.isDarkMode,
                  ).textColor,
                ),
                onPressed: null,
              ),
            ],
          ),
        ),
        // Clock digit columns with today's date.
        Container(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${_now.weekday}, ${_now.day} ${_now.monthInFull} ${_now.year}',
                style: Theme.of(context).textTheme.headline.copyWith(
                      fontWeight: FontWeight.bold,
                      color: getWeather(
                        _now.hour,
                        widget.weatherCondition,
                        isDarkMode: widget.isDarkMode,
                      ).textColor,
                    ),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Columns for the clock
                  DigitColumn(
                    digit: widget.is24HourFormat
                        ? '${_now.hourTens}'
                        : '${_now.hourTensIn12Hour}',
                    color: getDigitColumnColor(
                      _now.hour,
                      widget.isDarkMode,
                      widget.color,
                    ),
                  ),
                  DigitColumn(
                    digit: widget.is24HourFormat
                        ? '${_now.hourOnes}'
                        : '${_now.hourOnesIn12Hour}',
                    color: getDigitColumnColor(
                      _now.hour,
                      widget.isDarkMode,
                      widget.color,
                    ),
                  ),
                  DigitColumn(
                    digit: '${_now.minuteTens}',
                    color: getDigitColumnColor(
                      _now.hour,
                      widget.isDarkMode,
                      widget.color,
                    ),
                  ),
                  DigitColumn(
                    digit: '${_now.minuteOnes}',
                    color: getDigitColumnColor(
                      _now.hour,
                      widget.isDarkMode,
                      widget.color,
                    ),
                  ),
                  DigitColumn(
                    digit: '${_now.secondTens}',
                    color: getDigitColumnColor(
                      _now.hour,
                      widget.isDarkMode,
                      widget.color,
                    ),
                  ),
                  DigitColumn(
                    digit: '${_now.secondOnes}',
                    color: getDigitColumnColor(
                      _now.hour,
                      widget.isDarkMode,
                      widget.color,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Current location.
        Positioned(
          right: 20,
          bottom: 20,
          child: Text(
            '${widget.location}',
            style: Theme.of(context).textTheme.body1.copyWith(
                  color: getWeather(
                    _now.hour,
                    widget.weatherCondition,
                    isDarkMode: widget.isDarkMode,
                  ).textColor,
                ),
          ),
        ),
      ],
    );
  }
}
