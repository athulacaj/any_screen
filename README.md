# any_screen

[![pub package](https://img.shields.io/pub/v/any_screen.svg)](https://pub.dev/packages/any_screen)

`any_screen` is a Flutter package that simplifies the process of building responsive UIs. It provides a set of utilities and widgets to make it easier for developers to create layouts that adapt to different screen sizes and orientations.

## Features

- **Responsive Layouts:** Easily create responsive UIs that adapt to various screen sizes and orientations.
- **Screen Size Detection:** Detect the screen size at runtime to make dynamic layout decisions.
- **Custom Breakpoints:** Define custom breakpoints to handle specific screen size ranges.
- **Orientation Support:** Design layouts that work seamlessly in both portrait and landscape orientations.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  any_screen: ^0.1.0
```

## AnyScreenDefaultConfig.setConfig

`AnyScreenDefaultConfig.setConfig` is a method that allows you to set the default configuration for screen sizes in your application.

### Usage

```dart
void main() {
  // if you want to change default config
  AnyScreenDefaultConfig.setConfig(
    xs: 320,
    sm: 480,
    md: 768,
    lg: 1024,
    xl: 1366,
  );
  runApp(MyApp());
}
```

In the above example, `AnyScreenDefaultConfig.setConfig` is called with five parameters: `xs`, `sm`, `md`, `lg`, and `xl`. Each parameter represents a different screen size and accepts a value that will be used as the breakpoint for that screen size.

- `xs` is for extra small screens.
- `sm` is for small screens.
- `md` is for medium-sized screens.
- `lg` is for large screens.
- `xl` is for extra large screens.

The `AnyScreenDefaultConfig.setConfig` method should be called before `runApp` in your `main` function.

**Note:** If you want to change the configuration for a specific component, you can pass a configuration of type `AnyScreenConfig`.


## ResponsiveBuilder

`ResponsiveBuilder` is a widget that allows you to render different layouts based on the screen size.

### Usage

```dart
ResponsiveBuilder(
  builder: (context, screenType, widgetSize) {
    // note: can use screeType.index to get the index of the current screen type.
    if (screenType == ScreenType.md) {
      return Container(
        color: Colors.red,
        height: 100,
        width: widgetSize.pW(50),
      );
    }
    return Container(
      color: Colors.red,
      height: 100,
      width: widgetSize.pW(100),
    );
  },
),
```

In the above example, `ResponsiveBuilder` uses a builder function that takes three parameters: `context`, `screenType`, and `widgetSize`. 

- `context` is the build context.
- `screenType` is an enum that represents the current screen size. It can be `ScreenType.md` for medium-sized screens, and other values for different screen sizes.
- `widgetSize` is an object that provides methods to get percentage-based dimensions relative to the current screen size. For example, `widgetSize.pWidth(50)` returns a width that is 50% of the current screen width.

The builder function returns a `Container` widget with different widths based on the `screenType`. If the screen type is `ScreenType.md`, it returns a container with a width of 50% of the screen width. Otherwise, it returns a container with a width of 100% of the screen width.


## Responsive

`Responsive` is a widget that allows you to render different widgets based on the screen size.

### Usage

```dart
Responsive(
  builder: (context) => Container(
    color: Colors.red,
    height: 50.pW,
    width: 100.pH,
  ),
  sm: (context) => Container(
    color: Colors.green,
    height: 100,
    width: 100,
  ),
  md: (context) => Container(
    color: Colors.blue,
    height: 100,
    width: 100,
  ),
  lg: (context) => Container(
    color: Colors.yellow,
    height: 100,
    width: 100,
  ),
  xl: (context) => Container(
    color: Colors.purple,
    height: 100,
    width: 100,
  ),
),
```

In the above example, `Responsive` takes five parameters: `xs`, `sm`, `md`, `lg`, and `xl`. Each parameter represents a different screen size and accepts a widget function that will be rendered when the screen size matches the parameter.

**Note:** Can use `pW` and `pH` to get percentage-based dimensions relative to the parent size.


The `Responsive` widget will automatically render the appropriate widget based on the current screen size.


## ResponsiveGrid

`ResponsiveGrid` is a widget that allows you to create a responsive grid layout in Flutter. It automatically adjusts the number of columns based on the screen size.

### Usage

```dart
SizedBox(
  height: 300,
  child: ResponsiveGrid(
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    xs: 1,
    md: 3,
    lg: 4,
    itemHeight: 30,
    childrenBuilder: () => [
      Container(
        color: Colors.red,
        height: 400,
        width: 50,
      ),
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.green,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.amber,
        height: 100,
        width: 100,
      ),
    ],
  ),
)
```

In this example, the `ResponsiveGrid` will display 1 column for extra small screens, 3 columns for medium screens, and 4 columns for large screens. The height of each item is set to 30. The `mainAxisSpacing` and `crossAxisSpacing` are set to 10, which means there will be a 10-pixel gap between each item vertically and horizontally.

### Properties

- `mainAxisSpacing`: The space between each item along the main axis.
- `crossAxisSpacing`: The space between each item along the cross axis.
- `xs`: The number of columns for extra small screens.
- `md`: The number of columns for medium screens.
- `lg`: The number of columns for large screens.
- `itemHeight`: The height of each item.
- `childrenBuilder`: A function that returns the widgets to display in the grid.

## ResponsiveWrap

`ResponsiveWrap` is a widget that allows you to create a responsive layout in Flutter. It automatically adjusts the layout based on the screen size.

### Usage

```dart
ResponsiveWrap(
  items: [
    ResponsiveWrapChild(
      xs: 12,
      md: 6,
      lg: 4,
      child: Container(
        color: Colors.red,
        height: 100,
        width: 100,
      ),
    ),
    ResponsiveWrapChild(
      xs: 12,
      md: 6,
      lg: 4,
      child: Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
    ),
    ResponsiveWrapChild(
      xs: 12,
      lg: 4,
      child: Container(
        color: Colors.green,
        height: 100,
        width: 100,
      ),
    ),
    ResponsiveWrapChild(
      xs: 12,
      child: Container(
        color: Colors.amber,
        height: 100,
        width: 100,
      ),
    ),
  ],
  colCount: 12,
)
```

In this example, the `ResponsiveWrap` will adjust the layout based on the screen size. The `xs`, `md`, and `lg` properties of `ResponsiveWrapChild` specify the number of columns the child should span on extra small, medium, and large screens, respectively. The `colCount` property of `ResponsiveWrap` specifies the total number of columns in the layout.

### Properties

- `items`: The widgets to display in the layout. Each widget is wrapped in a `ResponsiveWrapChild`.
- `colCount`: The total number of columns in the layout.

## ResponsiveToggle

`ResponsiveToggle` is a widget that allows you to conditionally display a widget based on the screen size.

### Usage

```dart
ResponsiveToggle(
  builder: (context) {
    return Container(
      color: Colors.red,
      height: 100,
      width: 100,
      child: const Text('show this widget below the md screen size'),
    );
  },
  showBefore: ScreenType.md,
)
```

In this example, the `ResponsiveToggle` will display the widget returned by the `builder` function only on screens smaller than medium (`md`).

### Properties

- `builder`: A function that returns the widget to display.
- `showBefore`: The screen size before which the widget should be displayed.
