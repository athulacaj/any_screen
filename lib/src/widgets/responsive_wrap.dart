part of any_screen;

/// A Widget like wrap  with responsive support
/// [items] is a list of [ResponsiveWrapChild]
/// [colCount] is the number of columns in the wrap. If you give 12, then the children will be split into 12 parts.
class ResponsiveWrap extends StatelessWidget {
  const ResponsiveWrap({
    super.key,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
    required this.items,
    required this.colCount,
    this.config,
  });

  final Axis direction;
  final WrapAlignment alignment;
  final double spacing;
  final WrapAlignment runAlignment;
  final double runSpacing;
  final WrapCrossAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final Clip clipBehavior;
  final List<ResponsiveWrapChild> items;
  final int colCount;
  final AnyScreenConfig? config;

  @override
  Widget build(BuildContext context) {
    _direction = direction;
    _config = config;
    return ResponsiveBuilder(
        config: config,
        builder:
            (context, ScreenType screenType, ResponsiveWidgetSize widgetSize) {
          _colCount = colCount;
          return Wrap(
            key: key,
            direction: direction,
            alignment: alignment,
            spacing: spacing,
            runAlignment: runAlignment,
            runSpacing: runSpacing,
            crossAxisAlignment: crossAxisAlignment,
            textDirection: textDirection,
            verticalDirection: verticalDirection,
            clipBehavior: clipBehavior,
            children: items,
          );
        });
  }
}

int _colCount = 12;
Axis _direction = Axis.horizontal;
AnyScreenConfig? _config;

/// A child of [ResponsiveWrap]
/// [xs] is the share of the child in the wrap when the screen size is extra small
/// if you give 6, then the child will take 6/[colCount] of the wrap width/height.
/// can give [sm], [md], [lg], [xl] to specify the share of the child in the wrap when the screen size is small, medium, large, extra large respectively.
class ResponsiveWrapChild extends StatelessWidget {
  const ResponsiveWrapChild({
    super.key,
    required this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    required this.child,
  });
  final int xs;
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
        config: _config,
        builder:
            (context, ScreenType screenType, ResponsiveWidgetSize widgetSize) {
          int childSharePercentage = 0;
          switch (screenType) {
            case ScreenType.xl:
              childSharePercentage = xl ?? lg ?? md ?? sm ?? xs;
            case ScreenType.lg:
              childSharePercentage = lg ?? xl ?? md ?? sm ?? xs;
            case ScreenType.md:
              childSharePercentage = md ?? lg ?? sm ?? xs;
            case ScreenType.sm:
              childSharePercentage = sm ?? xs;
            case ScreenType.xs:
              childSharePercentage = sm ?? xs;
            default:
              childSharePercentage = xs;
          }
          return _direction == Axis.horizontal
              ? SizedBox(
                  width: (widgetSize.screenSize.width / _colCount) *
                      childSharePercentage,
                  child: child,
                )
              : SizedBox(
                  height: (widgetSize.screenSize.height / _colCount) *
                      childSharePercentage,
                  child: child,
                );
        });
  }
}
