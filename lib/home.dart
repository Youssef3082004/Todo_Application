import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget{
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}



class _Home extends State<Home>{

  TextEditingController email_var = TextEditingController() ;
  TextEditingController password_var = TextEditingController() ;

  @override
  Widget build(BuildContext context) {

    IconButton logout_btn = IconButton(onPressed: () => logout(), icon: Icon(Icons.logout_rounded),iconSize: 35,color: Colors.white,);

    AppBar appbar = AppBar(title: Text("Home Page"),centerTitle: true,backgroundColor: Colors.blue,actions: [logout_btn],);

    

    
    //! =========================================================  Application controls =================================================
    ListView controls = ListView(children: []); 
    Container main_app = Container(color: Colors.white,child: controls,padding: EdgeInsets.all(15));
    return Scaffold(body: main_app,appBar: appbar,);
  }



    
    

  MaterialButton sigin2(String path) => MaterialButton(child:Image.asset(path,fit: BoxFit.contain,width: 40,height: 40,) ,height: 70,color: Colors.grey.shade200,onPressed: (){},shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),);

  void logout()async{

    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
  }


}