import 'package:firebase_auth/firebase_auth.dart';
import 'package:codeathon/models/user.dart';
import 'package:codeathon/services/database.dart';

// Starting from Version firebase_auth 0.18.0:
// FirebaseUser has been changed to User
// AuthResult has been changed to UserCredential
// GoogleAuthProvider.getCredential() has been changed to GoogleAuthProvider.credential()
// onAuthStateChanged which notifies about changes to the user's sign-in state was replaced with authStateChanges()
// currentUser() which is a method to retrieve the currently logged in user, was replaced with the property currentUser and it no longer returns a Future<FirebaseUser>

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  FirebaseUser _userFromFirebaseUser(User user) {
    return user != null ? FirebaseUser(user.uid) : null;
  }

  //auth change
  Stream<FirebaseUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //register email and password
  Future register(String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseService(user.uid).updateUserData(username, 0);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
