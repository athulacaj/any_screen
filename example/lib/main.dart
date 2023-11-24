import 'package:flutter/material.dart';
import 'package:any_screen/any_screen.dart';

void main() {
  // if u want to change default config
  AnyScreenDefaultConfig.setConfig(
    xs: 320,
    sm: 480,
    md: 768,
    lg: 1024,
    xl: 1366,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                // ResponsiveBuilder(
                //   config: AnyScreenConfig(
                //     xs: 320,
                //     sm: 480,
                //     md: 768,
                //     lg: 1024,
                //     xl: 1366,
                //   ),
                //   builder: (context, screenType, widgetSize) {
                //     if (screenType == ScreenType.md) {
                //       return Container(
                //         color: Colors.red,
                //         height: 100,
                //         width: widgetSize.pWidth(50),
                //       );
                //     }
                //     return Container(
                //       color: Colors.red,
                //       height: 100,
                //       width: widgetSize.pWidth(100),
                //     );
                //   },
                // ),
                // Responsive(
                //   xs: Container(
                //     color: Colors.red,
                //     height: 100,
                //     width: 100,
                //   ),
                //   sm: Container(
                //     color: Colors.green,
                //     height: 100,
                //     width: 100,
                //   ),
                //   md: Container(
                //     color: Colors.blue,
                //     height: 100,
                //     width: 100,
                //   ),
                //   lg: Container(
                //     color: Colors.yellow,
                //     height: 100,
                //     width: 100,
                //   ),
                //   xl: Container(
                //     color: Colors.purple,
                //     height: 100,
                //     width: 100,
                //   ),
                // ),
                // ResponsiveToggle(
                //   showOnly: const [ScreenType.xs, ScreenType.sm],
                //   child: Container(
                //     color: Colors.red,
                //     height: 100,
                //     width: 100,
                //   ),
                // ),
                ResponsiveToggle(
                  showAfter: ScreenType.sm,
                  child: Container(
                    color: Colors.black,
                    height: 100,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
