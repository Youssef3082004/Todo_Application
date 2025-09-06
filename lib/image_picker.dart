import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';



class picker extends StatefulWidget{

  const picker({super.key});

  @override
  State<StatefulWidget> createState() => _picker();
}


class _picker extends State<picker>{

  File? fileimage;

  @override
  Widget build(BuildContext context) {
    
    AppBar appbar = AppBar(title: Text("image picker"),);



 



    ElevatedButton camera_button = ElevatedButton(onPressed: () async{await getimage();}, child:Text("Camera"));
    Column image_column = Column(children: [camera_button,if(fileimage != null)Image.file(fileimage!)],mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,);






    Container main_application = Container(child:image_column);
    return Scaffold(appBar:appbar,body: main_application,);
  }


  getimage()async{

    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null){
      fileimage = File(photo.path);
    }
    setState(() {});
  }

}