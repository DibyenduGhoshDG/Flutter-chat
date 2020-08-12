import 'package:flutter/material.dart';
import 'file:///D:/rice2/Flutter%20Aplication/chat_application/lib/Screens/signin.dart';
import 'file:///D:/rice2/Flutter%20Aplication/chat_application/lib/Screens/signup.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView);
    }else{
      return SignUp(toggleView);
    }
  }
}




