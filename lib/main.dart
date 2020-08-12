import 'package:chatapplication/Helper/helperFunction.dart';
import 'file:///D:/rice2/Flutter%20Aplication/chat_application/lib/Screens/chatRoom.dart';
import 'package:flutter/material.dart';
import 'package:chatapplication/Helper/authenticate.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool userIsLoggedIn;

  @override
  void initState() {
    getLoggedInScreen();
    super.initState();
  }

  getLoggedInScreen()async{
    await HelperFunction.getLoggedInSharedPreference().then((value){
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Chat App',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home:userIsLoggedIn != null ? userIsLoggedIn ? ChatRoom()
            : Authenticate() : Container(
          child: Center(
            child: Authenticate(),
          ),
        ),
    );
  }
}