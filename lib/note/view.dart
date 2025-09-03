import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/catagories/update.dart';
import 'package:firebase_app/note/add.dart';
import 'package:firebase_app/note/edit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Note extends StatefulWidget{

  final String catagoryid;
  final String catagoryname;
  const Note({super.key,required this.catagoryid,required this.catagoryname});
  @override
  State<Note> createState() => _Note();
}



class _Note extends State<Note>{

  TextEditingController email_var = TextEditingController() ;
  TextEditingController password_var = TextEditingController() ;

  List catagories = [];
  bool isloading = true;

  @override
  void initState() {
    get_data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    IconButton logout_btn = IconButton(onPressed: () => logout(), icon: Icon(Icons.logout_rounded),iconSize: 35,color: Colors.white,);

    AppBar appbar = AppBar(title: Text(widget.catagoryname,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white),),centerTitle: false,backgroundColor: Colors.orange,actions: [logout_btn],);

    GridView catagories_grid = GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),itemCount: catagories.length,itemBuilder: (context, index) => Item_builder(index: index));
    

    //! =========================================================  Loading Controls =================================================
    Column loading = Column(children: [CircularProgressIndicator(color: Colors.orange,),Text("Loading.....")],crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,spacing: 10,);

    //! =========================================================  Loading Controls =================================================
    
    AwesomeDialog(context: context,dialogType: DialogType.info,animType: AnimType.rightSlide,
            title: 'Dialog Title',desc: 'Dialog description here.............',btnCancelOnPress: () {},btnOkOnPress: () {});
    //! =========================================================  Application controls =================================================
    FloatingActionButton add_button = FloatingActionButton(onPressed: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCatagory(docid: widget.catagoryid),)),child: Icon(Icons.add,color:Colors.white),backgroundColor: Colors.orange,);
    // ListView controls = ListView(children: [catagories_grid]); 
    Container main_app = Container(color: Colors.white,child:isloading == true? Center(child: loading):catagories_grid,padding: EdgeInsets.all(15));
    return Scaffold(body: main_app,appBar: appbar,floatingActionButton: add_button,);
  }



    
    

  MaterialButton sigin2(String path) => MaterialButton(child:Image.asset(path,fit: BoxFit.contain,width: 40,height: 40,) ,height: 70,color: Colors.grey.shade200,onPressed: (){},shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),);


  void logout() async{
   await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
  }


  void get_data() async{
    QuerySnapshot data_query = await FirebaseFirestore.instance.collection("users").doc(widget.catagoryid).collection("note").get();
    // QuerySnapshot data_query = await FirebaseFirestore.instance.collection("users").doc().delete() //? For delete element

    await Future.delayed(Duration(seconds: 0));
    catagories.addAll(data_query.docs);
    setState(() {isloading = false;});
  }




  InkWell Item_builder({required int index}){

    AwesomeDialog alert =  AwesomeDialog(context: context,dialogType: DialogType.warning,animType: AnimType.rightSlide,btnOkText: "Delete",btnCancelText: "Cancel",
            title: 'Warning',desc: 'Are You sure to delete this Catagory?'
            ,btnOkOnPress: () {
              FirebaseFirestore.instance.collection("users").doc(widget.catagoryid).collection("note").doc(catagories[index].id).delete();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Note(catagoryid: widget.catagoryid, catagoryname: widget.catagoryname) ));}
);
    
    Text Catagory_name = Text("${catagories[index]["note"].toLowerCase()}",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700));
    Image folder = Image.asset("images/folder.png",width: 80,height: 80,fit: BoxFit.fill,);
    Column Controls = Column(children: [folder,Catagory_name],crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,);
    return InkWell(child: Card(child: Container(child:Controls ,height: 50,width: 50)),onLongPress: () => alert.show(),onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Editnote(notedocid: catagories[index].id, catagoryid: widget.catagoryid, Value: catagories[index]["note"]),)),);

  }


    
   
}

