import 'package:flutter/material.dart';
import 'package:wave_clock/utils.dart';

/// [ClockMarker] is the hourly time marker (i.e. 1300 hrs and 1PM)
/// to show the current wave level.
class ClockMarker extends StatelessWidget {
  const ClockMarker({
    Key key,
    @required this.is24HourFormat,
    @required this.isDarkMode,
  })  : assert(is24HourFormat != null),
        assert(isDarkMode != null),
        super(key: key);

  final bool is24HourFormat;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    final int numberOfMarkers = 25;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...List.generate(numberOfMarkers, (int index) {
            final int marker = numberOfMarkers - index - 1;
            return Row(
              children: <Widget>[
                Container(
                  width: 10.0,
                  height: 1,
                  color: isDarkMode
                      ? Theme.of(context).primaryColorDark.withOpacity(0.3)
                      : Theme.of(context).primaryColorLight.withOpacity(0.9),
                ),
                SizedBox(width: 5.0),
                Opacity(
                  opacity: index.isOdd ? 1 : 0,
                  child: SizedBox(
                    width: 40.0,
                    child: Text(
                      formatTimeMarker(marker, is24HourFormat),
                      style: Theme.of(context).textTheme.overline.copyWith(
                            fontSize: 7,
                            color: Theme.of(context)
                                .textTheme
                                .overline
                                .color
                                .withOpacity(0.3),
                          ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
