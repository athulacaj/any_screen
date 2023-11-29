part of any_screen;

/// Class that holds the responsive width and height of the parent widget.
/// It has a few useful methods like [pW],[pH].
/// [pW] returns the width of the parent widget based on the percentage you provide.
/// [pH] returns the height of the parent widget based on the percentage you provide.
class ResponsiveWidgetSize {
  /// last instance of [ResponsiveWidgetSize]
  static ResponsiveWidgetSize? _instance;
  static get instance => _instance;

  /// returns the last instance of [ResponsiveWidgetSize]
  factory ResponsiveWidgetSize(Size parentSize, BuildContext context) {
    _instance = ResponsiveWidgetSize._(parentSize, context);
    return _instance!;
  }
  ResponsiveWidgetSize._(this._parentSize, this.context);

  final Size _parentSize;
  final BuildContext context;

  get parentSize => _parentSize;
  get screenSize => MediaQuery.of(context).size;

  /// returns the width of the parent widget based on the percentage you provide.
  /// [percent] is the percentage of the parent widget's width.
  double pW(int percent) {
    assert(percent >= 0 && percent <= 100);
    return _parentSize.width * percent / 100;
  }

  /// returns the height of the parent widget based on the percentage you provide.
  /// [percent] is the percentage of the parent widget's height.
  double pH(int percent) {
    assert(percent >= 0 && percent <= 100);
    return _parentSize.height * percent / 100;
  }

  /// returns the width of the screen based on the percentage you provide.
  /// [percent] is the percentage of the screen's width.
  double vW(int percent) {
    return screenSize.width * percent / 100;
  }

  /// returns the height of the screen based on the percentage you provide.
  /// [percent] is the percentage of the screen's height.
  double vH(int percent) {
    return screenSize.height * percent / 100;
  }
}
