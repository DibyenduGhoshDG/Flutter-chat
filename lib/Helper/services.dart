import 'package:firebase_auth/firebase_auth.dart';
import 'model.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null ;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e);
    }
  }

  Future signUpwithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print("dg $e");
    }
  }

  Future resetpass(String email) async {
    try{
      return await _auth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e);
    }
  }

  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e);
    }
  }

}
