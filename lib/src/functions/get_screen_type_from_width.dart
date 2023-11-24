part of any_screen;

ScreenType getScreenTypeFromWidth(double width, AnyScreenConfig? config) {
  config ??= AnyScreenConfig.defaultConfig();
  if (width >= config.xl) {
    return ScreenType.xl;
  } else if (width >= config.lg) {
    return ScreenType.lg;
  } else if (width >= config.md) {
    return ScreenType.md;
  } else if (width >= config.sm) {
    return ScreenType.sm;
  } else {
    return ScreenType.xs;
  }
}
