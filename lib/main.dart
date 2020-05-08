import 'package:dnd_app_clone/utils/Responsiveness.dart';
import 'package:flutter/material.dart';

import 'UI/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          ResponsiveSizeConfig().init(constraints, orientation);
          return MaterialApp(
            title: 'Dnd App Clone',
            debugShowCheckedModeBanner: false,
            home: Home(),
          );
        });
      },
    );
  }
}
