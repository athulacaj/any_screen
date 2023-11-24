class AnyScreenDefaultConfig {
  static double _xs = 320;
  static double _sm = 480;
  static double _md = 768;
  static double _lg = 1024;
  static double _xl = 1366;
  static get xs => _xs;
  static get sm => _sm;
  static get md => _md;
  static get lg => _lg;
  static get xl => _xl;

  static void setConfig({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
  }) {
    _xs = xs ?? _xs;
    _sm = sm ?? _sm;
    _md = md ?? _md;
    _lg = lg ?? _lg;
    _xl = xl ?? _xl;
  }
}

class AnyScreenConfig {
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;

  AnyScreenConfig({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  factory AnyScreenConfig.defaultConfig() {
    return AnyScreenConfig(
      xs: AnyScreenDefaultConfig.xs,
      sm: AnyScreenDefaultConfig.sm,
      md: AnyScreenDefaultConfig.md,
      lg: AnyScreenDefaultConfig.lg,
      xl: AnyScreenDefaultConfig.xl,
    );
  }
}
