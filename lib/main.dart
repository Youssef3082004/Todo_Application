import 'package:firebase_app/catagories/add.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'stream.dart';
import 'image_picker.dart';
import 'auth/login.dart';
import 'auth/signup.dart';
import 'home.dart';
import 'Notification.dart';


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
        
    ThemeData Theming = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),appBarTheme: AppBarTheme(backgroundColor: Colors.orange,titleTextStyle: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white),iconTheme: IconThemeData(color: Colors.white,size: 35),));
    Map <String, Widget Function(BuildContext)> routes = {
    "login":(context) => Login(),
    "signup":(context) => Signup(),
    "home":(context) => Home(),
    "add":(context) => Add(),   

    };
    return MaterialApp(title: 'Flutter Demo',theme: Theming,home: FirebaseAuth.instance.currentUser == null? Login():Notification_test(),routes: routes,);
  }
}
