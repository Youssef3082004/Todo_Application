import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class Streampage extends StatefulWidget{  
  const Streampage({super.key});

  @override
  State<Streampage> createState() => _Streampage();

}


class _Streampage extends State<Streampage>{


  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> usersStream = FirebaseFirestore.instance.collection('users').snapshots();
    
    AppBar Stream_bar = AppBar(title: Text("Stream"),centerTitle: true);



    //! ================================================ Stream Builder =================================== 
    StreamBuilder stream_builder = StreamBuilder(stream: usersStream,builder: (context, snapshot) =>Stream_builder(context, snapshot));




    //! ================================================ main app container =================================== 


    Container mainapp = Container(child: stream_builder,);
    return Scaffold(appBar: Stream_bar,body: mainapp,);


  }

Widget Stream_builder(BuildContext context, AsyncSnapshot<dynamic> snapshot){

  if (snapshot.hasError) {return Text("Error");}
  if (snapshot.connectionState == ConnectionState.waiting) {return Text("Loading....");}
    
  return ListView.builder(itemCount: snapshot.data!.docs.length,
    itemBuilder: (context, index){
      var data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
      return Card(child: ListTile(title: Text("${data["age"]}")));
      }
    );
  









}



























}