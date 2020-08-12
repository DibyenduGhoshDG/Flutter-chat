import 'package:chatapplication/Helper/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chatapplication/Widget/widget.dart';
import 'package:chatapplication/Helper/database.dart';
import 'file:///D:/rice2/Flutter%20Aplication/chat_application/lib/Screens/conversation.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods databaseMethod = DatabaseMethods();
  TextEditingController searchEditingController = TextEditingController();
  QuerySnapshot snapshot;
  bool isLoading = false;
  bool haveUserSearched = false;

  initiateSearch() async {
    if (searchEditingController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });
      await databaseMethod
          .searchByName(searchEditingController.text)
          .then((resultSnapshot) {
        snapshot = resultSnapshot;
        print("$snapshot");
        setState(() {
          isLoading = false;
          haveUserSearched = true;
        });
      });
    }
  }

  Widget userList() {
    return haveUserSearched
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.documents.length,
            itemBuilder: (context, index) {
              return userTile(
                snapshot.documents[index].data["name"],
                snapshot.documents[index].data["email"],
              );
            })
        : Container();
  }

  createChartRoomAndStartConvertation(String userName) {
    String chatRoomId = getChatRoomId(userName, Constants.myName);
    List<String> users = [userName, Constants.myName];
    Map<String, dynamic> chatRoomMap = {
      "user": users,
      "chatRoomId": chatRoomId
    };
    databaseMethod.addMessage(chatRoomId, chatRoomMap);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConvertationScreen(chatRoomId: chatRoomId,)));
  }

  Widget userTile(String userName, String userEmail) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                userEmail,
                style: TextStyle(color: Colors.black87, fontSize: 14),
              )
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              createChartRoomAndStartConvertation(userName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(24)),
              child: Text(
                "Message",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          )
        ],
      ),
    );
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    color: Colors.white54,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                          controller: searchEditingController,
                          style: simpleTextStyle(),
                          decoration: InputDecoration(
                              hintText: 'search username',
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              ),
                        )),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            initiateSearch();
                          },
                        )
                      ],
                    ),
                  ),
                  userList()
                ],
              ),

    );
  }
}

/*

class SearchTile extends StatelessWidget {
  final String userName;
  final String userEmail;
  SearchTile({this.userName,this.userEmail});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        createChartRoomAndStartConvertation()
      },
      child: Container(
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(userName, style: simpleTextStyle(),),
                Text(userEmail, style: simpleTextStyle(),),
              ],
            ),
            Container(
              child: Text('Message'),
            )
          ],
        ),
      ),
    );
  }
}
*/
