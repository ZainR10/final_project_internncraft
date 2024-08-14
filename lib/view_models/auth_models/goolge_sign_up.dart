import 'package:final_project_internncraft/utils/general_utils.dart';
import 'package:final_project_internncraft/utils/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignUp {
  final BuildContext context;

  GoogleSignUp(this.context);

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

      if (gUser == null) {
        // User canceled the sign-in
        GeneralUtils.snackBar('Sign-in aborted by user', context);
        return;
      }

      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      GeneralUtils.snackBar('Account Created', context);
      Navigator.pushNamed(context, RoutesName.homeView);
    } catch (error) {
      GeneralUtils.snackBar(error.toString(), context);
    }
  }
}
