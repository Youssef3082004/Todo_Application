import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/componant/textformfeild.dart';



class update extends StatefulWidget{

  final String Docid;
  final String Docname;
  const update({super.key,required this.Docid,required this.Docname});

  @override
  State<update> createState() => _update();
}


class _update extends State<update>{

  TextEditingController catagory_name = TextEditingController(); 
  GlobalKey<FormState> Validotor = GlobalKey();
  CollectionReference users = FirebaseFirestore.instance.collection('users');


  @override
  void initState() {
    catagory_name.text = widget.Docname;
    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    
    //! =========================================================  Textfeild =================================================
    CustomTextFromFeild update_textfeild = CustomTextFromFeild(title: "Catagory", hint_text: "update the name of Your Catagory", password_or_no: false, controller: catagory_name);
    
    //! =========================================================  Button =================================================
    MaterialButton update_button = MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),onPressed: ()=> updateUser(),child: Text("Update Catagory",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700)),color: Colors.orange,);

    //! ========================================================= Controls =================================================
    ListView controls = ListView(children: [update_textfeild,SizedBox(height: 20,),update_button]);
    Container body = Container(child: controls,padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),);
    return Scaffold(appBar: AppBar(title: Text("Update Catagory")),body: body);

  }



  void updateUser() {
      users.doc(widget.Docid).update({'catagory': catagory_name.text});
      Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
    }

}