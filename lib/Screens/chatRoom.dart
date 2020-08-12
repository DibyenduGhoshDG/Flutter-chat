import 'package:chatapplication/Helper/helperFunction.dart';
import 'package:flutter/material.dart';
import 'file:///D:/rice2/Flutter%20Aplication/chat_application/lib/Helper/services.dart';
import 'file:///D:/rice2/Flutter%20Aplication/chat_application/lib/Screens/signin.dart';
import 'package:chatapplication/Helper/authenticate.dart';
import 'file:///D:/rice2/Flutter%20Aplication/chat_application/lib/Screens/searchScreen.dart';
import 'package:chatapplication/Helper/constants.dart';
import '../Widget/widget.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethod authMethod = AuthMethod();

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunction.getUserNameSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              authMethod.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Authenticate()));
            },
            child: Container(
              child: Center(child: Text('signOut',style: biggerTextStyle(),)),
            ),
          )
        ],
      ),
      body: SearchScreen(),
    );
  }
}
