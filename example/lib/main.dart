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
            child: ListView(
              children: [
                // ResponsiveBuilder(builder: (context, _, __) {
                //   return Container(
                //     color: Colors.red,
                //     height: 100,
                //     width: 100.pW,
                //   );
                // }),
                // Responsive(
                //   xs: (context) => Container(
                //     color: Colors.red,
                //     height: 100,
                //     width: 100.pW,
                //   ),
                // ),
                // Responsive(
                //   builder: (context) => Container(
                //     color: Colors.redAccent,
                //     height: 50.pH,
                //     width: 10.pW,
                //   ),
                // ),
                // Responsive(
                //   builder: (context) => Container(
                //     color: Colors.red,
                //     height: 100,
                //     width: 10.pW,
                //   ),
                //   sm: (context) => Container(
                //     color: Colors.green,
                //     height: 100,
                //     width: 100,
                //   ),
                //   md: (context) => Container(
                //     color: Colors.blue,
                //     height: 100,
                //     width: 100,
                //   ),
                //   lg: (context) => Container(
                //     color: Colors.yellow,
                //     height: 100,
                //     width: 100,
                //   ),
                //   xl: (context) => Container(
                //     color: Colors.purple,
                //     height: 100,
                //     width: 100,
                //   ),
                // ),

                // Responsive(
                //   builder: (context) => Container(
                //     color: Colors.purpleAccent,
                //     height: 50,
                //     width: 30.pW,
                //   ),
                // ),

                /// responsive grid
                SizedBox(
                  height: 300,
                  child: ResponsiveGrid(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    // itemHeight: ,
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
                ),

                /// responsive wrap
                // ResponsiveWrap(
                //   items: [
                //     ResponsiveWrapChild(
                //       xs: 12,
                //       md: 6,
                //       lg: 4,
                //       child: Container(
                //         color: Colors.red,
                //         height: 100,
                //         width: 100,
                //       ),
                //     ),
                //     ResponsiveWrapChild(
                //       xs: 12,
                //       md: 6,
                //       lg: 4,
                //       child: Container(
                //         color: Colors.blue,
                //         height: 100,
                //         width: 100,
                //       ),
                //     ),
                //     ResponsiveWrapChild(
                //       xs: 12,
                //       lg: 4,
                //       child: Container(
                //         color: Colors.green,
                //         height: 100,
                //         width: 100,
                //       ),
                //     ),
                //     ResponsiveWrapChild(
                //       xs: 12,
                //       child: Container(
                //         color: Colors.amber,
                //         height: 100,
                //         width: 100,
                //       ),
                //     ),
                //   ],
                //   colCount: 12,
                // ),

                /// show this wiget below the md screen size
                // ResponsiveToggle(
                //   builder: (context) {
                //     return Container(
                //       color: Colors.red,
                //       height: 100,
                //       width: 100,
                //       child: const Text(
                //           'show this wiget below the md screen size'),
                //     );
                //   },
                //   showBefore: ScreenType.md,
                // ),

                /// or use show method extension of widget only if the  widget is child of any_screen widgets
                // Responsive(
                //   builder: (context) {
                //     return Container(
                //       color: Colors.red,
                //       height: 100,
                //       width: 100,
                //       child: const Text(
                //           'show this wiget below the md screen size'),
                //     ).show(showBefore: ScreenType.md);
                //   },
                // ),
              ],
            ),
          ),
        ));
  }
}
