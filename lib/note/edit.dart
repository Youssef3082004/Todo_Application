import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/note/view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_app/componant/textformfeild.dart';



class Editnote extends StatefulWidget{

  final String notedocid;
  final String catagoryid;
  final String Value;
  const Editnote({super.key,required this.notedocid,required this.catagoryid,required this.Value});

  @override
  State<Editnote> createState() => _Editnote();
}



class _Editnote extends State<Editnote>{

  TextEditingController note = TextEditingController(); 
  GlobalKey<FormState> Validotor = GlobalKey();
  CollectionReference users = FirebaseFirestore.instance.collection('users');


  @override
  void initState() {
    note.text = widget.Value; 
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    
    //! =========================================================  Textfeild =================================================
    CustomTextFromFeild Editnote_textfeild = CustomTextFromFeild(title: "Note", hint_text: "add the name of Your Note", password_or_no: false, controller: note);

    //! =========================================================  Button =================================================
    MaterialButton Editnote_button = MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(25)),onPressed: ()=> addUser(),child: Text("Edit Note",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w700)),color: Colors.orange,);

    //! ========================================================= Controls =================================================
    ListView controls = ListView(children: [Editnote_textfeild,SizedBox(height: 20,),Editnote_button]);
    Container body = Container(child: controls,padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),);
    return Scaffold(appBar: AppBar(title: Text(widget.Value)),body: body);

  }


  void addUser() {
    users.doc(widget.catagoryid).collection("note").doc(widget.notedocid).update({"note":note.text});
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Note(catagoryid: widget.catagoryid, catagoryname: "catagory")));
    }

}