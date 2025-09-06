import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';





class Notification_test extends StatefulWidget{
  const Notification_test({super.key});

  @override
  State<Notification_test> createState() => _Notification_test();
}


class _Notification_test extends State<Notification_test>{

  @override
  void initState() {
    Gettoken();
    Myrequestpermission();
    super.initState();
  }


@override
  Widget build(BuildContext context) {
   
   AppBar Page_appbar = AppBar(title: Text("Notification"),backgroundColor: Colors.blue,);
   
   Container main_app = Container(); 
   return Scaffold(appBar: Page_appbar,body: main_app,);
   
  }



  Gettoken() async{
    String? token = await FirebaseMessaging.instance.getToken();
    print("===========================");
    print("token = $token");
  }

  Myrequestpermission()async{
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(alert: true,announcement: false,badge: true,carPlay: false,criticalAlert: false,provisional: false,sound: true,);
    print('User granted permission: ${settings.authorizationStatus}');}
}