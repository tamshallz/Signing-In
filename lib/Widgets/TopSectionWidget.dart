import 'package:dnd_app_clone/utils/Colors.dart';
import 'package:dnd_app_clone/utils/Images.dart';
import 'package:dnd_app_clone/utils/Responsiveness.dart';
import 'package:flutter/material.dart';
import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';


class TopSectionWidget extends StatefulWidget {
  @override
  _TopSectionWidgetState createState() => _TopSectionWidgetState();
}

class _TopSectionWidgetState extends State<TopSectionWidget> {

    final controller = PageController(initialPage: 0);

    List<Widget> items = [
    Image.asset(Images.welcome),
    Image.asset(Images.window),
    Image.asset(Images.moving),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1*ResponsiveSizeConfig.heightMultiplier,),
              child: PageView(
                children: items,
                controller: controller,
              ),
            ),
          ),
          SizedBox(height: 10),
          ScrollingPageIndicator(
            dotColor: AppColors.colorGrey,
            dotSelectedColor:  Color(0xffC4C4C4),
            dotSize: 8,
            orientation: Axis.horizontal,
            dotSelectedSize: 16,
            dotSpacing: 25,
            controller: controller,
            itemCount: items.length,
          )
        ],
      ),
    );
  }
}