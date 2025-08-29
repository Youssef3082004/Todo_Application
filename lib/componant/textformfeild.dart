import 'package:flutter/material.dart';



class CustomTextFromFeild extends StatefulWidget{

  final String? title;
  final String? hint_text;
  final bool? password_or_no;
  final TextEditingController? controller;
  const CustomTextFromFeild({super.key,required this.title,required this.hint_text,required this.password_or_no,required this.controller});

  @override
  State<CustomTextFromFeild> createState() => _CustomTextFromFeild();
}


class _CustomTextFromFeild extends State<CustomTextFromFeild>{

  bool see = false;

  @override
  Widget build(BuildContext context) {
    const TextStyle style = TextStyle(fontSize: 20,fontWeight: FontWeight.w600);  
    Text email_text = Text(widget.title!,style:style);
    TextFormField textfeild =  TextFormField(decoration: _textfeild_decor(hint_text:widget.hint_text!,password:widget.password_or_no! ),obscureText:widget.password_or_no! == true ? !see :see  ,controller: widget.controller);

    return Column(children: [email_text,textfeild],crossAxisAlignment: CrossAxisAlignment.start);
  }

  InputDecoration _textfeild_decor({required String hint_text,required bool password}) {
      
      if (password == true){
         TextButton forget = TextButton(child: Text("Forget Password?",style: TextStyle(color: Colors.black87),),onPressed: (){});

        return InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.grey.shade400)),
        enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.grey.shade200)),suffixIcon: IconButton(icon: Icon(see ? Icons.visibility : Icons.visibility_off),onPressed: () => setState(() {see = !see;}),)
        ,fillColor: Colors.grey[200],filled: true,hint: Text(hint_text),counter:forget );
      }
      
      else{
        return InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.grey.shade400)),
        enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide: BorderSide(color: Colors.grey.shade200))
        ,fillColor: Colors.grey[200],filled: true,hint: Text(hint_text));
      }

    } 
}