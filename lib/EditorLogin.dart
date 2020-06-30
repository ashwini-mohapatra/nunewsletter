

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nunewsletter/AlertDialogBox.dart';
import 'package:nunewsletter/Authentication.dart';
import 'package:nunewsletter/form_submit_button.dart';

enum FormType{login,register}
class SignInSignUp extends StatefulWidget {


  SignInSignUp({@required this.auth,@required this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  _SignInSignUpState createState() => _SignInSignUpState();
}

class _SignInSignUpState extends State<SignInSignUp> {
   final TextEditingController _passwordcontroller = new TextEditingController();
  final TextEditingController _emailcontroller = new TextEditingController();
  final FocusNode _emailFocusNode=FocusNode();
  final FocusNode _passwordFocusNode=FocusNode();

  String a="Log In",b="Login",c="Forgot Password";
  AlertDialogBox abc=new AlertDialogBox();
   final FirebaseAuth _firebaseauth=FirebaseAuth.instance;

  void submit() async{
    final authResult=await _firebaseauth.signInWithEmailAndPassword(email: _emailcontroller.text, password: _passwordcontroller.text);
    FirebaseUser mUser=authResult.user;
    if(mUser.uid!=null){
      Navigator.pop(context);
        abc.Information(context," Login Successful","Successfully Logged in to Account");
        _firebaseauth.signOut();
      }
      else{
        abc.Information(context," Login UnSuccessful","Error faced while attempting to login to account Account");
      }
  }
  void toggle() {
    }

  void _emaileditcomplete(){
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anukriti Editor Login"),
      ),
      body: Container(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createinp(),
          ),
        ),
      ),
    );
  }
  List<Widget> createinp(){
    return [
      SizedBox(height: 25.0,),
      Text(a,
        style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 10.0,),
      TextField(
        controller: _emailcontroller,
        decoration:
        InputDecoration(labelText: 'Email-Id',
          hintText: 'test@test.com',
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        focusNode: _emailFocusNode,
        onEditingComplete: _emaileditcomplete,
      ),
      SizedBox(height: 10.0,),
      TextField(
        controller: _passwordcontroller,
        decoration:
        InputDecoration(labelText: 'Password',
          hintText: '1223445',
        ),
        textInputAction: TextInputAction.done,
        obscureText: true,
        focusNode: _passwordFocusNode,
      ),
      SizedBox(height: 10.0,),
      FormSubmitButton(
        text: b,
        onPressed: submit,
      ),
      SizedBox(height: 10.0,),
      FlatButton(
        child: Text(
            c,
            style:TextStyle(
              color: Colors.black,
            )
        ),
        onPressed: toggle,
      ),
    ];
  }
}
