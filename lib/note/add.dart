import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/note/view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/componant/textformfeild.dart';



class AddCatagory extends StatefulWidget{

  final String docid;
  const AddCatagory({super.key,required this.docid});

  @override
  State<AddCatagory> createState() => _AddCatagory();
}



class _AddCatagory extends State<AddCatagory>{

  TextEditingController note = TextEditingController(); 
  GlobalKey<FormState> Validotor = GlobalKey();
  CollectionReference users = FirebaseFirestore.instance.collection('users');


  @override
  Widget build(BuildContext context) {

    
    //! =========================================================  Textfeild =================================================
    CustomTextFromFeild addCatagory_textfeild = CustomTextFromFeild(title: "Catagory", hint_text: "add the name of Your Catagory", password_or_no: false, controller: note);

    //! =========================================================  Button =================================================
    MaterialButton addCatagory_button = MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),onPressed: ()=> addUser(),child: Text("Add Catagory",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700)),color: Colors.orange,);

    //! ========================================================= Controls =================================================
    ListView controls = ListView(children: [addCatagory_textfeild,SizedBox(height: 20,),addCatagory_button]);
    Container body = Container(child: controls,padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),);
    return Scaffold(appBar: AppBar(title: Text("Catagory")),body: body);

  }


  void addUser() {
     users.doc(widget.docid).collection("note").add({"note":note.text});
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Note(catagoryid: widget.docid, catagoryname: "catagory")));
    }

}