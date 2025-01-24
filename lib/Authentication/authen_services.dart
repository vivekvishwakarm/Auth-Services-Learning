import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices{
  FirebaseAuth auth = FirebaseAuth.instance;

  // Register
  Future<User?> createUserWithEmailAndPassword(String email, String password) async{
    try{
      final credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      log("Something went wrong");
    }
    return null;
  }

  //Login
  Future<User?> loginUserWithEmailAndPassword(String email, String password) async {
    try{
      final credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    }catch(e){
      log("Something went wrong");
    }
    return null;
  }

  //SignOut
  Future<void> signOut() async{
    try{
      await auth.signOut();
    }catch(e){
      log("Something went wrong");
    }
  }
}