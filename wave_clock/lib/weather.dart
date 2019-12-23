import 'package:flutter/material.dart';

// [Weather] model for holding icon, text and wave colors based on weather condition.
class Weather {
  Weather({
    this.icon,
    this.textColor = Colors.black,
    this.waveColor = Colors.blue,
  });

  IconData icon;
  Color textColor;
  Color waveColor;
}
