part of any_screen;

/// Responsive widget that builds itself based on the parent widget's size.
/// This widget is based on the width of the parent widget.
/// If the parent widget changes size, this widget will rebuild itself to adapt to the new size.
/// This widget is useful for creating responsive UIs that change their layout or appearance
/// [builder] is the builder function that will be called when the screen size changes.
/// [builder] is a callback function that takes [BuildContext], [ScreenType], and [ResponsiveWidgetSize] as parameters.
/// [ScreenType] is the type of the screen based on the width of the parent widget.
/// [ResponsiveWidgetSize] is a class that contains the width and height of the parent widget. It has a few useful methods like [pWidth],[pHeight].
/// [config] is the configuration of the screen sizes. You can change the default screen sizes by setting [AnyScreenDefaultConfig] or passing [AnyScreenConfig]
class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    super.key,
    required this.builder,
    this.config,
  });
  final Widget Function(BuildContext context, ScreenType screenType,
      ResponsiveWidgetSize widgetSize) builder;
  final AnyScreenConfig? config;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      /// size of the parent widget
      final Size size = MediaQuery.of(context).size;
      final width = size.width;
      final Size parentSize = Size(
        constraints.maxWidth == double.infinity
            ? size.width
            : constraints.maxWidth,
        constraints.maxHeight == double.infinity
            ? size.height
            : constraints.maxHeight,
      );
      final screenType = getScreenTypeFromWidth(width, config);
      final widgetSize = ResponsiveWidgetSize(parentSize, context);
      return builder(context, screenType, widgetSize);
    });
  }
}
