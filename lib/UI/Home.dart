import 'package:dnd_app_clone/Widgets/DownSectionWidget.dart';
import 'package:dnd_app_clone/Widgets/TopSectionWidget.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        SafeArea(
          bottom: false,
          left: false,
          right: false,
          child: Column(
            children: <Widget>[
              TopSectionWidget(),
              SizedBox(height: 20),
              DownSectionWidget(),
            ],
          ),
        ),
      ]),
    );
  }
}
