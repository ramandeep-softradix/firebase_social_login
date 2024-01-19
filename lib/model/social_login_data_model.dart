import 'package:firebase_auth/firebase_auth.dart';

class SocialLoginDataModel{
  String? socialId = "";
  User? firebaseAuthUser;
  bool status;
  String errorMessage;

  SocialLoginDataModel({required this.socialId, required this.firebaseAuthUser,
    required this.status, required this.errorMessage});


  @override
  String toString() {
    // TODO: implement toString
    return "{socialId: ${socialId},status: ${status},errorMessage: ${errorMessage}, firebaseAuthUser: ${firebaseAuthUser}}";
  }

}