import 'package:flutter/material.dart';

/// [DigitColumn] is to represent a single digit integer.
class DigitColumn extends StatelessWidget {
  const DigitColumn({
    Key key,
    @required this.digit,
    @required this.color,
    this.flex = 1,
  })  : assert(digit != null),
        assert(color != null),
        super(key: key);

  final String digit;
  final Color color;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 430),
          curve: Curves.ease,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            color: color,
          ),
          margin: const EdgeInsets.all(6.0),
          child: Center(
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                digit,
                style: Theme.of(context).textTheme.display4.copyWith(
                      color: Colors.black.withOpacity(0.2),
                      fontSize: 200,
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
