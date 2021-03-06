import 'package:dnd_app_clone/UI/ProfileScreen.dart';
import 'package:dnd_app_clone/UI/SignUp.dart';
import 'package:dnd_app_clone/Widgets/TextField.dart';
import 'package:dnd_app_clone/utils/Colors.dart';
import 'package:dnd_app_clone/utils/Images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'CustomRichText.dart';

//Facebook Provider package
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

//
class DownSectionWidget extends StatefulWidget {
  @override
  _DownSectionWidgetState createState() => _DownSectionWidgetState();
}

class _DownSectionWidgetState extends State<DownSectionWidget> {
  //
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Facebook Sign In
  bool _isLoggedIn = false;
  Map userProfile;
  final facebookLogin = FacebookLogin();

  //

  _loginWithFB() async {
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        setState(() {
          _isLoggedIn = true;
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false);
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false);
        break;
    }
  }

  //
  Future<FirebaseUser> _signIn(BuildContext context) async {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Sign In'),
    ));

    //
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );

    AuthResult authResult =
        await _firebaseAuth.signInWithCredential(credential);

    FirebaseUser userDetails = authResult.user;

    ProviderDetails providerInfo = ProviderDetails(userDetails.providerId);

    List<ProviderDetails> providerData = List<ProviderDetails>();

    providerData.add(providerInfo);

    UserDetails details = UserDetails(
      userDetails.providerId,
      userDetails.displayName,
      userDetails.photoUrl,
      userDetails.email,
      providerData,
    );

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(detailUser: details),
        ));

    // return 'signInWithGoogle succeeded: $user';
  }

  //
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
              onTap: () => _signIn(context)
                  .then(
                    (FirebaseUser user) => print(user),
                  )
                  .catchError((e) => print(e)),
            ),
            CustomTextField(
                buttonIcon: Images.facebook,
                buttonText: 'Continue with Facebook',
                onTap: () => _loginWithFB()),
            CustomOutlineTextField(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String photoUrl;
  final String userEmail;
  final List<ProviderDetails> providerData;

  UserDetails(this.providerDetails, this.userName, this.photoUrl,
      this.userEmail, this.providerData);
}

class ProviderDetails {
  final String provideDetails;
  ProviderDetails(this.provideDetails);
}
