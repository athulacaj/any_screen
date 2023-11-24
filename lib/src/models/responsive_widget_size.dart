import 'package:flutter/widgets.dart';

/// Class that holds the responsive width and height of the parent widget.
/// It has a few useful methods like [pWidth],[pHeight].
/// [pWidth] returns the width of the parent widget based on the percentage you provide.
/// [pHeight] returns the height of the parent widget based on the percentage you provide.
class ResponsiveWidgetSize {
  ResponsiveWidgetSize(this.context) {
    size = MediaQuery.of(context).size;
  }
  final BuildContext context;
  late Size size;

  get width => size.width;
  get height => size.height;

  double pWidth(double percent) {
    assert(percent >= 0 && percent <= 100);
    return size.width * percent / 100;
  }

  double pHeight(double percent) {
    assert(percent >= 0 && percent <= 100);
    return size.height * percent / 100;
  }
}
