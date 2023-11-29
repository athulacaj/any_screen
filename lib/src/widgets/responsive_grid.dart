part of any_screen;

/// A Widget like GridView with responsive support
/// [xs] is the crossAxisCount for xs screen size
/// [sm] is the crossAxisCount for sm screen size
/// [md] is the crossAxisCount for md screen size
/// [lg] is the crossAxisCount for lg screen size
/// [xl] is the crossAxisCount for xl screen size
/// [childrenBuilder] is the function which returns the list of widgets to be shown in the GridView
/// [itemCount] is the itemCount for GridView.builder
/// [mainAxisSpacing] is the mainAxisSpacing for GridView.builder
/// [crossAxisSpacing] is the crossAxisSpacing for GridView.builder
/// [itemHeight] is the itemHeight for GridView.builder
/// all other properties are same as GridView.builder
class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    required this.childrenBuilder,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    required this.mainAxisSpacing,
    required this.crossAxisSpacing,
    required this.itemHeight,
    required this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
  });

  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final List<Widget> Function() childrenBuilder;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final Clip clipBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double itemHeight;
  final int xs; // crossAxisCount for xs screen size
  final int? sm;
  final int? md;
  final int? lg;
  final int? xl;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder:
        (context, ScreenType screenType, ResponsiveWidgetSize widgetSize) {
      int crossAxisCount = 2;
      switch (screenType) {
        case ScreenType.xl:
          crossAxisCount = xl ?? lg ?? md ?? sm ?? xs;
        case ScreenType.lg:
          crossAxisCount = lg ?? xl ?? md ?? sm ?? xs;
        case ScreenType.md:
          crossAxisCount = md ?? lg ?? sm ?? xs;
        case ScreenType.sm:
          crossAxisCount = sm ?? xs;
        case ScreenType.xs:
          crossAxisCount = sm ?? xs;
        default:
          crossAxisCount = xs;
      }

      final Size size = MediaQuery.of(context).size;
      return GridView(
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: controller,
        primary: primary,
        physics: physics,
        shrinkWrap: shrinkWrap,
        padding: padding,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: 10,
          childAspectRatio: (size.width / crossAxisCount) / itemHeight,
        ),
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,
        dragStartBehavior: dragStartBehavior,
        clipBehavior: clipBehavior,
        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        children: childrenBuilder(),
      );
    });
  }

  /// A Widget like GridView.builder with responsive support
  /// [xs] is the crossAxisCount for xs screen size
  /// [sm] is the crossAxisCount for sm screen size
  /// [md] is the crossAxisCount for md screen size
  /// [lg] is the crossAxisCount for lg screen size
  /// [xl] is the crossAxisCount for xl screen size
  /// [itemBuilder] is the itemBuilder for GridView.builder
  /// [itemCount] is the itemCount for GridView.builder
  /// [mainAxisSpacing] is the mainAxisSpacing for GridView.builder
  /// [crossAxisSpacing] is the crossAxisSpacing for GridView.builder
  /// [itemHeight] is the itemHeight for GridView.builder
  /// all other properties are same as GridView.builder
  static Widget builder({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    List<Widget> children = const <Widget>[],
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    required double mainAxisSpacing,
    required double crossAxisSpacing,
    required double itemHeight,
    required int xs,
    int? sm,
    int? md,
    int? lg,
    int? xl,
    required Widget? Function(BuildContext context, int index) itemBuilder,
  }) {
    return ResponsiveBuilder(builder:
        (context, ScreenType screenType, ResponsiveWidgetSize widgetSize) {
      int crossAxisCount = 2;
      switch (screenType) {
        case ScreenType.xl:
          crossAxisCount = xl ?? lg ?? md ?? sm ?? xs;
        case ScreenType.lg:
          crossAxisCount = lg ?? xl ?? md ?? sm ?? xs;
        case ScreenType.md:
          crossAxisCount = md ?? lg ?? sm ?? xs;
        case ScreenType.sm:
          crossAxisCount = sm ?? xs;
        case ScreenType.xs:
          crossAxisCount = sm ?? xs;
        default:
          crossAxisCount = xs;
      }

      final Size size = MediaQuery.of(context).size;
      return GridView.builder(
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: controller,
        primary: primary,
        physics: physics,
        shrinkWrap: shrinkWrap,
        padding: padding,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: 10,
          childAspectRatio: (size.width / crossAxisCount) / itemHeight,
        ),
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,
        dragStartBehavior: dragStartBehavior,
        clipBehavior: clipBehavior,
        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        itemCount: children.length,
        itemBuilder: itemBuilder,
      );
    });
  }
}
