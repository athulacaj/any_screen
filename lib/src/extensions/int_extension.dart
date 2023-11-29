part of any_screen;

/// Extension on [double] to provide useful methods like [pW],[pH],[vW],[vH].
extension AnyScreenIntExtension on int {
  /// returns the width of the parent widget based on the percentage you provide.
  /// Use this method inside only in any any_screen widgets
  double get pW {
    ResponsiveWidgetSize? instance = ResponsiveWidgetSize.instance;
    if (instance == null) {
      throw Exception(
          'Use ` $this.pW ` value inside only in child widgets of any_screen widgets');
    }
    return instance.pW(this);
  }

  /// returns the height of the parent widget based on the percentage you provide.
  /// Use this method inside only in any any_screen widgets
  /// [percent] is the percentage of the parent widget's height.
  double get pH {
    ResponsiveWidgetSize? instance = ResponsiveWidgetSize.instance;
    if (instance == null) {
      throw Exception(
          'Use ` $this.pH ` value inside only in child widgets of any any_screen widgets');
    }
    return instance.pH(this);
  }
}
