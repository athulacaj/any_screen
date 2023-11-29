// ignore_for_file: non_constant_identifier_names

part of any_screen;

/// Responsive widget that builds itself based on the parent widget's size.
/// This widget is based on the width of the parent widget.
/// If the parent widget changes size, this widget will rebuild itself to adapt to the new size.
/// This widget is useful for creating responsive UIs that change their layout or appearance
/// based on the available screen size. For example, you might create different
/// layouts for large screens, small screens, and landscape orientation.
/// [builder] will act as xs also
/// [builder] is the required parameter. if you don't provider other parameters, [builder] will be rendered on all screen sizes.
/// The order of the parameters is [builder], [sm], [md], [lg], [xl].
/// if you provide [builder] and md, [builder] willeb rendered for [sm] and [builder] screen sizes and [md] will be rendered for [md], [lg], and [xl] screen sizes.
/// you can change the default screen sizes by setting [AnyScreenDefaultConfig] or passing [AnyScreenConfig].
class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.builder,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.config,
  });

  final Widget Function(BuildContext context) builder;
  final Widget Function(BuildContext context)? sm;
  final Widget Function(BuildContext context)? md;
  final Widget Function(BuildContext context)? lg;
  final Widget Function(BuildContext context)? xl;
  final AnyScreenConfig? config;
  // builer

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder:
          (context, ScreenType screenType, ResponsiveWidgetSize widgetSize) {
        late Widget Function(BuildContext context) returnWidget;
        switch (screenType) {
          case ScreenType.xl:
            returnWidget = xl ?? lg ?? md ?? sm ?? builder;
          case ScreenType.lg:
            returnWidget = lg ?? xl ?? md ?? sm ?? builder;
          case ScreenType.md:
            returnWidget = md ?? lg ?? sm ?? builder;
          case ScreenType.sm:
            returnWidget = sm ?? builder;
          case ScreenType.xs:
            returnWidget = sm ?? builder;
          default:
            returnWidget = builder;
        }
        return returnWidget(context);
      },
      config: config,
    );
  }
}
