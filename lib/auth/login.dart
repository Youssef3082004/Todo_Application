import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:firebase_app/componant/textformfeild.dart";


class Login extends StatefulWidget{
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}



class _Login extends State<Login>{

  TextEditingController email_var = TextEditingController() ;
  TextEditingController password_var = TextEditingController() ;

  @override
  Widget build(BuildContext context) {



    //! =========================================================  interface image =================================================
    BoxDecoration decor = BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(90));
    Container image_container = Container(child: Image.asset("images/logo.png",width: 50,height: 50,fit: BoxFit.fill,),padding: EdgeInsets.only(left: 10),decoration: decor,width: 80,height: 80,alignment: Alignment.center,);
    Column image = Column(children: [SizedBox(height: 50,),image_container]);
    
    //! =========================================================  Login Text =================================================
    Text login_text = Text("Login",textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w700));
    Text sub_login_text = Text("Login to continue using the app",textAlign: TextAlign.left,style: TextStyle(color: Colors.grey[500],fontSize: 15));
    Column Texts = Column(children: [login_text,sub_login_text],spacing: 10,crossAxisAlignment: CrossAxisAlignment.start,);

    //! =========================================================  interface Textfeilds =================================================
    const TextStyle style = TextStyle(fontSize: 20,fontWeight: FontWeight.w600);  

    CustomTextFromFeild email = CustomTextFromFeild(title: "Email",hint_text: "Enter Your E-mail", password_or_no: false,controller: email_var,);
    CustomTextFromFeild password = CustomTextFromFeild(title: "Password",hint_text: "Enter your Password", password_or_no: true,controller: password_var);

    Column form = Column(children: [email,SizedBox(height: 20,),password],crossAxisAlignment: CrossAxisAlignment.start,);

    //! =========================================================  interface Buttons =================================================

    MaterialButton login_button = MaterialButton(child: Text("Login",style:style),onPressed: ()=> signin(),color: Color(0xffffaf3d),height: 40,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),textColor: Colors.white,);

    Row divide = Row(children: [Text("or login using",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)],mainAxisAlignment: MainAxisAlignment.center,);

    Row sigin_options = Row(children: [sigin2("images/facebook.png"),sigin2("images/google.png"),sigin2("images/apple.png")],mainAxisAlignment: MainAxisAlignment.center,spacing: 15,);



    //! =========================================================  Go To Register Page =================================================
    Text have_account = Text("Don't Have an Account?",style:style);
    TextButton rigster_page = TextButton(child: Text("Rigster",style: TextStyle(color: Color(0xffffaf3d),fontSize: 20),),onPressed: (){Navigator.of(context).pushReplacementNamed("signup");},);
    Row last = Row(children: [have_account,rigster_page],mainAxisAlignment: MainAxisAlignment.center,spacing: 0);

    //! =========================================================  Application controls =================================================
    ListView controls = ListView(children: [image,SizedBox(height: 25),Texts,SizedBox(height: 25),form,SizedBox(height: 20),login_button,SizedBox(height: 20,),divide,SizedBox(height: 25),sigin_options,SizedBox(height: 40,),last]); 
    Container main_app = Container(color: Colors.white,child: controls,padding: EdgeInsets.all(15));
    return Scaffold(body: main_app,);
  }


    //? =========================================================  Functions  ==================================================================

    
    

  void signin () async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email_var.text,password: password_var.text);
      Navigator.of(context).pushReplacementNamed("home");
    } 
    on FirebaseAuthException catch (e) {
        print('${e.hashCode}');

      if (e.hashCode == 'invalid-credential') {
        appear_dialog(context);

        print('No user found for that email.');
        
      }
     else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
      }
    } 
  }

  void appear_dialog(BuildContext context) => showDialog(barrierDismissible: false,context: context, builder: (context){
  
    return AlertDialog(
      title: Text("Error"),
      content: Text("Hello in Flutter Corse"),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("ok"))],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      
    );
  });

  MaterialButton sigin2(String path) => MaterialButton(child:Image.asset(path,fit: BoxFit.contain,width: 40,height: 40,) ,height: 70,color: Colors.grey.shade200,onPressed: (){},shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),);




}