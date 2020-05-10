import 'package:dnd_app_clone/UI/ProfileScreen.dart';
import 'package:dnd_app_clone/Widgets/Buttons.dart';
import 'package:dnd_app_clone/Widgets/TextField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SignIn.dart';

// SCAFFOLD STARTS HERE
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isVisible = true;
  final _auth = FirebaseAuth.instance;
  //
  String email;
  String password;

  // SIGN IN
  Future<String> signIn(String email, String password) async {
    AuthResult result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  // SIGN UP
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  // SIGN OUT
  Future<void> signOut() async {
    return _auth.signOut();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isVisible
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image

                SvgPicture.asset(
                  'assets/svg/auth.svg',
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    'Register',
                    style: GoogleFonts.comfortaa(
                        fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                //Email
                NormalField(
                  text: 'Email Address',
                  obscure: false,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                // Password
                NormalField(
                  text: 'Password',
                  obscure: true,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                // Button
                Button(
                  text: 'Register',
                  onTap: () async {
                    print(email);
                    print(password);
                    //
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (newUser != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                // Already have an account
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'Already Registered? ',
                      style: GoogleFonts.comfortaa(
                          color: Colors.black, fontSize: 16),
                    ),
                    TextSpan(
                      text: 'Sign In',
                      style: GoogleFonts.comfortaa(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ])),
                ),
              ],
            )
          : SignIn(),
    );
  }
}
