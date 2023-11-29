part of any_screen;

/// ScreenType enum
enum ScreenType {
  xs,
  sm,
  md,
  lg,
  xl;
}

/// ScreenType extension
extension ScreenTypeExtension on ScreenType {
  double value({AnyScreenConfig? config}) {
    config ??= AnyScreenConfig.defaultConfig();
    switch (this) {
      case ScreenType.xs:
        return config.xs;
      case ScreenType.sm:
        return config.sm;
      case ScreenType.md:
        return config.md;
      case ScreenType.lg:
        return config.lg;
      case ScreenType.xl:
        return config.xl;
      default:
        return config.xs;
    }
  }
}
