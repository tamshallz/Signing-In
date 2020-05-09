import 'package:dnd_app_clone/Widgets/TextField.dart';
import 'package:dnd_app_clone/utils/Colors.dart';
import 'package:dnd_app_clone/utils/Images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

import 'CustomRichText.dart';

//

class DownSectionWidget extends StatefulWidget {
  @override
  _DownSectionWidgetState createState() => _DownSectionWidgetState();
}

class _DownSectionWidgetState extends State<DownSectionWidget> {
  //
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
              onTap: () => _signIn(context)
                  .then(
                    (FirebaseUser user) => print(user),
                  )
                  .catchError((e) => print(e)),
            ),
            CustomOutlineTextField(
              onTap: () => _signIn(context)
                  .then(
                    (FirebaseUser user) => print(user),
                  )
                  .catchError((e) => print(e)),
            )
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

class ProfileScreen extends StatelessWidget {
  //
  final UserDetails detailUser;

  const ProfileScreen({Key key, this.detailUser}) : super(key: key);

  //
  @override
  Widget build(BuildContext context) {
    //
    final GoogleSignIn _gSignIn = GoogleSignIn();

    //
    return Scaffold(
      appBar: AppBar(
        title: Text(detailUser.userName),

        // To not have a leading back button, you do this
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
              icon: Icon(LineAwesomeIcons.sign_out),
              onPressed: () {
                _gSignIn.signOut();
                print('Signed Out');
                Navigator.pop(context);
              })
        ],
      ),

      //
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(detailUser.photoUrl),
              radius: 50,
            ),
            SizedBox(height: 10),
            Text(
              'Name: ' + detailUser.userName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            Text(
              'Email: ' + detailUser.userEmail,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            Text(
              'Provider: ' + detailUser.providerDetails,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
