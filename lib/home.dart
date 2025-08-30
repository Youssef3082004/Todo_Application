import 'package:cloud_firestore/cloud_firestore.dart';
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

  List catagories = [];

  @override
  void initState() {
    get_data();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    IconButton logout_btn = IconButton(onPressed: () => logout(), icon: Icon(Icons.logout_rounded),iconSize: 35,color: Colors.white,);

    AppBar appbar = AppBar(title: Text("Home",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700,color: Colors.white),),centerTitle: false,backgroundColor: Colors.orange,actions: [logout_btn],);

    GridView catagories_grid = GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),itemCount: catagories.length,itemBuilder: (context, index) => Item_builder(index: index));
    

    
    //! =========================================================  Application controls =================================================
    FloatingActionButton add_button = FloatingActionButton(onPressed: ()=> Navigator.of(context).pushNamed("add"),child: Icon(Icons.add,color:Colors.white),backgroundColor: Colors.orange,);
    // ListView controls = ListView(children: [catagories_grid]); 
    Container main_app = Container(color: Colors.white,child: catagories_grid,padding: EdgeInsets.all(15));
    return Scaffold(body: main_app,appBar: appbar,floatingActionButton: add_button,);
  }



    
    

  MaterialButton sigin2(String path) => MaterialButton(child:Image.asset(path,fit: BoxFit.contain,width: 40,height: 40,) ,height: 70,color: Colors.grey.shade200,onPressed: (){},shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),);

  void logout() async{

   await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);

  }


  void get_data() async{
    QuerySnapshot data_query = await FirebaseFirestore.instance.collection("users").get();
    catagories.addAll(data_query.docs);
    setState(() {});
  }


  Card Item_builder({required int index}){
    
    Text Catagory_name = Text("${catagories[index]["catagory"].toLowerCase()}",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700));
    Image folder = Image.asset("images/folder.png",width: 80,height: 80,fit: BoxFit.fill,);
    Column Controls = Column(children: [folder,Catagory_name],crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,);
    return Card(child: Container(child:Controls ,height: 50,width: 50));

  }

}