import 'package:dnd_app_clone/utils/Images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String buttonText;
  final String buttonIcon;
  final Function onTap;

  CustomTextField({this.buttonIcon, this.buttonText, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
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
        onTap: onTap,
      ),
    );
  }
}

class CustomOutlineTextField extends StatelessWidget {
  final Function onTap;

  const CustomOutlineTextField({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
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
        onTap: onTap,
      ),
    );
  }
}

// LOGIN TEXT FIELD
class NormalField extends StatelessWidget {
  //
  final String text;
  final Function onChanged;
  final bool obscure;

  const NormalField({Key key, this.text, this.onChanged, this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14),
      child: TextField(
        obscureText: obscure,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          labelText: text,
          labelStyle: GoogleFonts.comfortaa(
            fontSize: 16,
            color: Colors.grey[700],
          ),
        ),
      ),
    );
  }
}
