import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:social_login_plugin/model/social_login_data_model.dart';

import 'social_login_plugin_platform_interface.dart';

class SocialLoginPlugin {
  Future<void>iniFirebase()async{
    await Firebase.initializeApp();
  }
   Future<String?> getPlatformVersion() {
    return SocialLoginPluginPlatform.instance.getPlatformVersion();
  }

  static const _successConst = "success";
  static const _failureConst = "failure";


  Future<SocialLoginDataModel?> signInWithGoogle() async {
    try {
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: <String>[
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );
      await _googleSignIn.signOut();
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        return null;
      }

      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential googleIdCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(googleIdCredential);
      User? firebaseUser = userCredential.user;
      return SocialLoginDataModel(
          socialId: googleSignInAccount.id,
          firebaseAuthUser: firebaseUser,
          errorMessage: _successConst,
          status: true);
    } catch (e) {
      log("e---------->$e");
      displayError(e);
      return SocialLoginDataModel(
          socialId: null,
          firebaseAuthUser: null,
          errorMessage: "${e.toString()}",
          status: false);

    }
  }

  Future<SocialLoginDataModel?> signInWithApple() async {
    try {
      var redirectURL =
          "https://SERVER_AS_PER_THE_DOCS.glitch.me/callbacks/sign_in_with_apple";
      var clientID = "AS_PER_THE_DOCS";
      var appleIdCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          webAuthenticationOptions: WebAuthenticationOptions(
              clientId: clientID, redirectUri: Uri.parse(redirectURL)));

      final oAuthProvider = OAuthProvider('apple.com');

      final mcredential = oAuthProvider.credential(
        idToken: appleIdCredential?.identityToken,
        accessToken: appleIdCredential?.authorizationCode,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(mcredential);
      User? firebaseUser = userCredential.user;

      return SocialLoginDataModel(
          socialId: appleIdCredential.userIdentifier,
          firebaseAuthUser: firebaseUser,
          errorMessage: _successConst,
          status: true);
    } catch (e) {
      displayError(e);
      return SocialLoginDataModel(
          socialId: null,
          firebaseAuthUser: null,
          errorMessage: "${e.toString()}",
          status: false);
    }
  }

  Future<SocialLoginDataModel?> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(); // by default we request the email and the public profile
// or FacebookAuth.i.login()
      if (result.status == LoginStatus.success) {
        // you are logged
        AccessToken? accessToken = result.accessToken;
        Map<String, dynamic> userData =
            await FacebookAuth.instance.getUserData();
        print("userData : ${userData}");
        print("accessToken : ${accessToken?.token ?? ""}");

        final OAuthCredential credential =
            FacebookAuthProvider.credential(accessToken?.token ?? "");
        // Once signed in, return the UserCredential
        final userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        User? firebaseUser = userCredential.user;

        return SocialLoginDataModel(
            socialId: firebaseUser?.providerData?.first.uid ?? "",
            firebaseAuthUser: firebaseUser,
            errorMessage: _successConst,
            status: true);
      } else {
        return SocialLoginDataModel(
            socialId: null,
            firebaseAuthUser: null,
            errorMessage: result.message ?? _failureConst,
            status: false);
      }
    }  catch (e) {
      log("e---->${e}");
      displayError(e.toString());
      return SocialLoginDataModel(
          socialId: null,
          firebaseAuthUser: null,
          errorMessage: "${e.toString()}",
          status: false);
    }
  }
}
void displayError(dynamic error) {
  log("Error: $error");
  Fluttertoast.showToast(
    msg: "An error occurred: ${error.toString()}",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}