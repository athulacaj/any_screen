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
    if (screenType == ScreenType.md) {
      return Container(
        color: Colors.red,
        height: 100,
        width: widgetSize.pWidth(50),
      );
    }
    return Container(
      color: Colors.red,
      height: 100,
      width: widgetSize.pWidth(100),
    );
  },
),
```

In the above example, `ResponsiveBuilder` uses a builder function that takes three parameters: `context`, `screenType`, and `widgetSize`. 

- `context` is the build context.
- `screenType` is an enum that represents the current screen size. It can be `ScreenType.md` for medium-sized screens, and other values for different screen sizes.
- `widgetSize` is an object that provides methods to get percentage-based dimensions relative to the current screen size. For example, `widgetSize.pWidth(50)` returns a width that is 50% of the current screen width.

The builder function returns a `Container` widget with different widths based on the `screenType`. If the screen type is `ScreenType.md`, it returns a container with a width of 50% of the screen width. Otherwise, it returns a container with a width of 100% of the screen width.

GitHub Copilot: Sure, here's a draft for the `Responsive` component from your `any_screen` package.

## Responsive

`Responsive` is a widget that allows you to render different widgets based on the screen size.

### Usage

```dart
Responsive(
  xs: Container(
    color: Colors.red,
    height: 100,
    width: 100,
  ),
  sm: Container(
    color: Colors.green,
    height: 100,
    width: 100,
  ),
  md: Container(
    color: Colors.blue,
    height: 100,
    width: 100,
  ),
  lg: Container(
    color: Colors.yellow,
    height: 100,
    width: 100,
  ),
  xl: Container(
    color: Colors.purple,
    height: 100,
    width: 100,
  ),
),
```

In the above example, `Responsive` takes five parameters: `xs`, `sm`, `md`, `lg`, and `xl`. Each parameter represents a different screen size and accepts a widget that will be rendered when the screen size matches the parameter.


The `Responsive` widget will automatically render the appropriate widget based on the current screen size.

## ResponsiveToggle

`ResponsiveToggle` is a widget that allows you to conditionally render a widget based on the screen size.

### Usage

```dart
ResponsiveToggle(
  showAfter: ScreenType.md,
  child: Container(
    color: Colors.green,
    height: 100,
    width: 100,
  ),
),
```

In the above example, `ResponsiveToggle` takes two parameters: `showAfter` and `child`.

- `showAfter` is an enum that represents the screen size after which the child widget will be rendered. It can be `ScreenType.md` for medium-sized screens, and other values for different screen sizes.
- `child` is the widget that will be rendered when the screen size is larger than the `showAfter` value.

In this case, the `Container` widget will only be rendered on screens larger than `ScreenType.md`.

