import 'dart:math';

import 'package:flutter/material.dart';

import 'package:wave_clock/wave_clipper.dart';

/// [Wave] is the main wave widget which holds all the related widgets.
class Wave extends StatefulWidget {
  const Wave({
    Key key,
    @required this.size,
    @required this.xOffset,
    @required this.yOffset,
    @required this.color,
    @required this.duration,
    @required this.opacity,
  })  : assert(size != null),
        assert(xOffset != null),
        assert(yOffset != null),
        assert(color != null),
        assert(duration != null),
        assert(opacity != null),
        super(key: key);

  final Size size;
  final double xOffset;
  final double yOffset;
  final Color color;
  final int duration;
  final double opacity;

  @override
  State<StatefulWidget> createState() => _WaveState();
}

class _WaveState extends State<Wave> with TickerProviderStateMixin {
  AnimationController animation;
  List<Offset> waveOffsets = [];

  @override
  void initState() {
    super.initState();
    // Create animation controller with specific duration.
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    );

    // Add animation listener to create different offsets in clip path.
    animation.addListener(() {
      waveOffsets.clear();
      for (double i = -2 - widget.xOffset;
          i <= widget.size.width.toInt() + 2;
          i++) {
        waveOffsets.add(
          Offset(
            i.toDouble() + widget.xOffset,
            sin((animation.value * 360.0 - i) % 360.0 * pi / 180.0) * 15 +
                50 +
                widget.yOffset,
          ),
        );
      }
    });

    // Repeat the animation.
    animation.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.opacity,
      child: AnimatedBuilder(
        animation: CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        ),
        builder: (context, child) => ClipPath(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 2),
            curve: Curves.fastOutSlowIn,
            width: widget.size.width,
            height: widget.size.height,
            color: widget.color,
          ),
          clipper: WaveClipper(
            animation.value,
            waveOffsets,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }
}
