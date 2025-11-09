import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

final class AuthApiService {
  static final AuthApiService _sharedInstance = AuthApiService();
  static AuthApiService shared() {
    return _sharedInstance;
  }

  Future<UserCredential?> signUpAnonymously() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      debugPrint("Signed in with temporary account.");
      return userCredential;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          debugPrint("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          debugPrint("Unknown error.");
      }
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      debugPrint("Signed in with temporary account.");
      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          debugPrint("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          debugPrint("Unknown error.");
      }
      return false;
    }
  }
}
