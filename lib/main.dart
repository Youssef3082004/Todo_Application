import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/login.dart';
import 'auth/signup.dart';
import 'home.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});


  void initState(){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('==============================================User is signed in!');
    }
  });
  }

  @override
  Widget build(BuildContext context) {
        
    ThemeData Theming = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple));
    Map <String, Widget Function(BuildContext)> routes = {
    "login":(context) => Login(),
    "signup":(context) => Signup(),
    "home":(context) => Home()

    
    
    };
    return MaterialApp(title: 'Flutter Demo',theme: Theming,home: FirebaseAuth.instance.currentUser == null? Login():Home(),routes: routes,);
  }
}
