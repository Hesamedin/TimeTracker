import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> currentUser() async {
    return await _firebaseAuth.currentUser();
  }
  Future<FirebaseUser> signInAnonymously() async {
    return await _firebaseAuth.signInAnonymously();
  }
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}