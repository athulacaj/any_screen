import 'package:flutter/material.dart';
import 'package:any_screen/any_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
                ResponsiveToggle(
                  showOnly: const [ScreenType.xs, ScreenType.sm],
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                  ),
                ),
                ResponsiveToggle(
                  showAfter: ScreenType.md,
                  child: Container(
                    color: Colors.green,
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
