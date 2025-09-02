import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/componant/textformfeild.dart';



class Add extends StatefulWidget{
  const Add({super.key});

  @override
  State<Add> createState() => _Add();
}



class _Add extends State<Add>{

  TextEditingController catagory_name = TextEditingController(); 
  GlobalKey<FormState> Validotor = GlobalKey();
  CollectionReference users = FirebaseFirestore.instance.collection('users');


  @override
  Widget build(BuildContext context) {

    
    //! =========================================================  Textfeild =================================================
    CustomTextFromFeild add_textfeild = CustomTextFromFeild(title: "Catagory", hint_text: "add the name of Your Catagory", password_or_no: false, controller: catagory_name);

    //! =========================================================  Button =================================================
    MaterialButton add_button = MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),onPressed: ()=> addUser(),child: Text("Add Catagory",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700)),color: Colors.orange,);

    //! ========================================================= Controls =================================================
    ListView controls = ListView(children: [add_textfeild,SizedBox(height: 20,),add_button]);
    Container body = Container(child: controls,padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),);
    return Scaffold(appBar: AppBar(title: Text("Add Catagory")),body: body);

  }


  void addUser() {
      users.add({'catagory': catagory_name.text,"id":FirebaseAuth.instance.currentUser!.uid});
      Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
    }

}