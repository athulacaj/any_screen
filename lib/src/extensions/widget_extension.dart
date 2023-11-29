part of any_screen;

extension AnyScreenWidgetExtension on Widget {
  /// Show the widget basedon the condition.
  /// if you provide [showOnly] and [showAfter], [showOnly] will be ignored.
  /// [showAfter] will show the widget after the specified screen size.
  /// [showOnly] will show the widget only on the specified screen sizes.
  Widget show({
    ScreenType? showAfter,
    ScreenType? showBefore,
    List<ScreenType>? showOnly,
    AnyScreenConfig? config,
  }) {
    ResponsiveWidgetSize? instance = ResponsiveWidgetSize.instance;

    if (instance == null) {
      throw Exception(
          'Use ` .show() ` method inside only in child widgets of any any_screen widgets');
    }
    final screenType =
        getScreenTypeFromWidth(instance.screenSize.width, config);

    if (showBefore != null && screenType.index < showBefore.index) {
      return this;
    } else if (showAfter != null && screenType.index > showAfter.index) {
      return this;
    } else if (showAfter == null &&
        showBefore == null &&
        showOnly != null &&
        showOnly.contains(screenType)) {
      return this;
    }
    return const SizedBox();
  }
}
