import 'package:any_screen/src/config.dart';
import 'package:any_screen/src/models/responsive_widget_size.dart';
import 'package:any_screen/src/models/screen_types.dart';
import 'package:flutter/material.dart';
import 'responsive_builder.dart';

/// Responsive widget that builds itself based on the parent widget's size.
/// This widget is based on the width of the parent widget.
/// If the parent widget changes size, this widget will rebuild itself to adapt to the new size.
/// This widget is useful for creating responsive UIs that needs to hide or show widgets based on the available screen size.
/// can pass [showOnly] to show the widget only on the specified screen sizes or pass [showAfter] to show the widget after the specified screen size.
/// if you provide [showOnly] and [showAfter], [showOnly] will be ignored.
class ResonsiveToggle extends StatelessWidget {
  const ResonsiveToggle(
      {super.key,
      required this.child,
      this.config,
      this.showAfter,
      this.showOnly = const [
        ScreenType.xs,
        ScreenType.sm,
        ScreenType.md,
        ScreenType.lg,
        ScreenType.xl
      ]});

  final Widget child;
  final List<ScreenType>? showOnly;
  final ScreenType? showAfter;
  final AnyScreenConfig? config;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, screenType, ResponsiveWidgetSize widgetSize) {
        if (showAfter != null && showAfter!.index <= screenType.index) {
          return child;
        } else if (showOnly != null && showOnly!.contains(screenType)) {
          return child;
        }
        return const SizedBox();
      },
      config: config,
    );
  }
}
