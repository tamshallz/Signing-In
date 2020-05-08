import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomRichText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: '''Get things done 
with ''',
          style: GoogleFonts.mada(textStyle: TextStyle(fontSize: 28)),
          children: <TextSpan>[
            TextSpan(
                text: 'To-Do.',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
          ]),
    );
  }
}
