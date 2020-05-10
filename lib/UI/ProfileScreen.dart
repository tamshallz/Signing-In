import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:dnd_app_clone/Widgets/DownSectionWidget.dart';

//

//

class ProfileScreen extends StatefulWidget {
  //
  final UserDetails detailUser;

  const ProfileScreen({Key key, this.detailUser}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    final GoogleSignIn _gSignIn = GoogleSignIn();

    //
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),

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
            CircleAvatar(radius: 50),
            SizedBox(height: 10),
            Center(
              child: Text(
                'Logged In successfully',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
