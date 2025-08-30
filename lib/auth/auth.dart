import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Functions{

  final String? name;
  const Functions({required this.name});

  static void signin({required BuildContext context, required String email , required String password}) async {
    final navigator = Navigator.of(context);
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,password: password);
      navigator.pushReplacementNamed("home");
    } 
    on FirebaseAuthException catch (e) {
        print('${e.hashCode}');
      if (e.code == 'invalid-credential') {
        print('No user found for that email.');
      }
     else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
      }
    } 
  }




// static Future signInWithGoogle(BuildContext context) async {
//     final GoogleSignInAccount googleUser = await GoogleSignIn.instance.authenticate();

//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//     final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
//     await FirebaseAuth.instance.signInWithCredential(credential);
//     Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
// }


  

  void signup({required BuildContext context, required String email , required String password}) async{
    final navigator = Navigator.of(context);
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,password:password);
      navigator.pushReplacementNamed("home");
    } 
    
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } 
      else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } 
    catch (e) {print(e);}
  }






}