part of any_screen;

/// Extension method on the [Widget] class that adds a responsive toggle functionality.
///
/// The [responsiveToggle] method allows you to toggle the visibility of a widget based on the screen type.
/// In  [showOnly] You can specify a list of [ScreenType] values to show the widget only on those screen types.
/// The [showAfter] parameter is a [ScreenType] value that specifies the screen type after which the widget should be shown.
///
/// Example usage:
/// ```dart
/// Container().responsiveToggle(
///   config: AnyScreenConfig(),
///   showAfter: ScreenType.xs,
/// );
/// ```
extension AnyWidgetExtension on Widget {
  responsiveToggle({
    List<ScreenType>? showOnly,
    AnyScreenConfig? config,
    ScreenType? showAfter,
  }) {
    return ResonsiveToggle(
      showOnly: showOnly,
      config: config,
      showAfter: showAfter,
      child: this,
    );
  }
}
