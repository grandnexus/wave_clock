import 'package:flutter/material.dart';

/// [WaveClipper] to create wave animation using [CustomClipper].
class WaveClipper extends CustomClipper<Path> {
  WaveClipper(
    this.animation,
    this.waveOffsets,
  )   : assert(animation != null),
        assert(waveOffsets != null);

  final double animation;
  List<Offset> waveOffsets = [];

  @override
  Path getClip(Size size) {
    // Create new path.
    final Path path = Path();

    // Draw wave in clip path using offset points.
    path.addPolygon(waveOffsets, false);

    // Draw lines to fill up the space below the wave.
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);

    // Close the path.
    path.close();

    return path;
  }

  @override
  bool shouldReclip(WaveClipper oldClipper) =>
      animation != oldClipper.animation;
}
