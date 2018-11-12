import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class User {
  User({@required this.uid});
  final String uid;
}

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }
  Future<User> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }
  Future<User> signInAnonymously() async {
    FirebaseUser user = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(user);
  }
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}