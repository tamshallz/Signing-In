import 'package:dnd_app_clone/Widgets/TextField.dart';
import 'package:dnd_app_clone/utils/Colors.dart';
import 'package:dnd_app_clone/utils/Images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomRichText.dart';

class DownSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 415,
      color: AppColors.colorTeal,
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FittedBox(
              child: CustomRichText(),
            ),
            SizedBox(height: 10),
            FittedBox(
              child: Text(
                '''Create an account to organize your tasks
and projects from any device. it's free.''',
                style: GoogleFonts.ubuntu(
                    textStyle: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            CustomTextField(
              buttonIcon: Images.google,
              buttonText: 'Continue with Google',
            ),
            CustomTextField(
              buttonIcon: Images.facebook,
              buttonText: 'Continue with Facebook',
            ),
            CustomOutlineTextField()
          ],
        ),
      ),
    );
  }
}
