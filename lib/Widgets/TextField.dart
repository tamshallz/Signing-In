import 'package:dnd_app_clone/utils/Images.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String buttonText;
  final String buttonIcon;

  CustomTextField({this.buttonIcon, this.buttonText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 60),
            child: Image.asset(buttonIcon),
          ),
          Text(buttonText)
        ]),
      ),
    );
  }
}

class CustomOutlineTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        height: 45,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(30)),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 60),
            child: Image.asset(Images.email),
          ),
          Text('Continue with Email', style: TextStyle(color: Colors.white))
        ]),
      ),
    );
  }
}
