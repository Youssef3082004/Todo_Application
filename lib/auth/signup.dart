import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:firebase_app/componant/textformfeild.dart";


class Signup extends StatefulWidget{
  const  Signup({super.key});
  @override
  State<Signup> createState() => _Signup();
}



class _Signup extends State<Signup>{
  
  TextEditingController username_var = TextEditingController() ;
  TextEditingController email_var = TextEditingController() ;
  TextEditingController password_var = TextEditingController() ;
  @override
  Widget build(BuildContext context) {



    //! =========================================================  interface image =================================================
    BoxDecoration decor = BoxDecoration(color: Colors.grey[300],borderRadius: BorderRadius.circular(90));
    Container image_container = Container(child: Image.asset("images/logo.png",width: 50,height: 50,fit: BoxFit.fill,),padding: EdgeInsets.only(left: 10),decoration: decor,width: 80,height: 80,alignment: Alignment.center,);
    Column image = Column(children: [SizedBox(height: 50,),image_container]);
    
    //! =========================================================  Login Text =================================================
    Text login_text = Text("Signup",textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w700));
    Text sub_login_text = Text("Login to continue using the app",textAlign: TextAlign.left,style: TextStyle(color: Colors.grey[500],fontSize: 15));
    Column Texts = Column(children: [login_text,sub_login_text],spacing: 10,crossAxisAlignment: CrossAxisAlignment.start,);

    //! =========================================================  interface Textfeilds =================================================
    const TextStyle style = TextStyle(fontSize: 20,fontWeight: FontWeight.w600);  

    CustomTextFromFeild username = CustomTextFromFeild(title: "Username",hint_text: "Enter your Username", password_or_no: false,controller: username_var);

    CustomTextFromFeild email = CustomTextFromFeild(title: "Email",hint_text: "Enter Your E-mail", password_or_no: false,controller: email_var,);
    CustomTextFromFeild password = CustomTextFromFeild(title: "Password",hint_text: "Enter your Password", password_or_no: true,controller: password_var);

    Column form = Column(children: [username,SizedBox(height: 20,),email,SizedBox(height: 20,),password],crossAxisAlignment: CrossAxisAlignment.start,);

    MaterialButton login_button = MaterialButton(child: Text("Signup",style:style),onPressed: () => signup(),color: Color(0xffffaf3d),height: 40,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),textColor: Colors.white,);
    

    //! =========================================================  Go To Register Page =================================================
    Text have_account = Text("Have an Account?",style:style);
    TextButton rigster_page = TextButton(child: Text("Login",style: TextStyle(color: Color(0xffffaf3d),fontSize: 20),),onPressed: () => Navigator.of(context).pushReplacementNamed("login"),);
    Row last = Row(children: [have_account,rigster_page],mainAxisAlignment: MainAxisAlignment.center,spacing: 0);

    //! =========================================================  Application controls =================================================
    ListView controls = ListView(children: [image,SizedBox(height: 25),Texts,SizedBox(height: 25),form,SizedBox(height: 20),login_button,SizedBox(height: 40,),last]); 
    Container main_app = Container(color: Colors.white,child: controls,padding: EdgeInsets.all(15));
    return Scaffold(body: main_app);
  }



  void signup() async{

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email_var.text,password: password_var.text,);
      Navigator.of(context).pushReplacementNamed("home");
    } 

    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } 
      else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } 
    catch (e) {print(e);}
  }



  


}