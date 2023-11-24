// ignore_for_file: non_constant_identifier_names

import 'package:any_screen/src/config.dart';
import 'package:any_screen/src/models/responsive_widget_size.dart';
import 'package:any_screen/src/models/screen_types.dart';
import 'package:flutter/widgets.dart';
import 'responsive_builder.dart';

/// Responsive widget that builds itself based on the parent widget's size.
/// This widget is based on the width of the parent widget.
/// If the parent widget changes size, this widget will rebuild itself to adapt to the new size.
/// This widget is useful for creating responsive UIs that change their layout or appearance
/// based on the available screen size. For example, you might create different
/// layouts for large screens, small screens, and landscape orientation.
/// [xs] is the widget that will be rendered when the screen width is less than 576px.
/// [xs] is the required parameter. if you don't provider other parameters, [xs] will be rendered on all screen sizes.
/// The order of the parameters is [xs], [sm], [md], [lg], [xl].
/// if you provide [xs] and md, [xs] willeb rendered for [sm] and [xs] screen sizes and [md] will be rendered for [md], [lg], and [xl] screen sizes.
/// you can change the default screen sizes by setting [AnyScreenDefaultConfig] or passing [AnyScreenConfig].
class Responsive extends StatelessWidget {
  const Responsive({
    super.key,
    required this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.config,
  });

  final Widget xs;
  final Widget? sm;
  final Widget? md;
  final Widget? lg;
  final Widget? xl;
  final AnyScreenConfig? config;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder:
          (context, ScreenType screenType, ResponsiveWidgetSize widgetSize) {
        switch (screenType) {
          case ScreenType.xl:
            return xl ?? lg ?? md ?? sm ?? xs;
          case ScreenType.lg:
            return lg ?? xl ?? md ?? sm ?? xs;
          case ScreenType.md:
            return md ?? lg ?? sm ?? xs;
          case ScreenType.sm:
            return sm ?? xs;
          case ScreenType.xs:
            return sm ?? xs;
          default:
            return xs;
        }
      },
      config: config,
    );
  }
}
