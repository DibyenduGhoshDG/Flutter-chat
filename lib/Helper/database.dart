import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  getUserByUserEmail(String userEmail) async {
    return await Firestore.instance
        .collection("user")
        .where("email", isEqualTo: userEmail)
        .getDocuments();
  }

  uploadUserInfo(userMap) {
    Firestore.instance.collection('user').add(userMap);
  }

  searchByName(String searchField) {
    return Firestore.instance
        .collection("user")
        .where('name', isEqualTo: searchField)
        .getDocuments();
  }

  addMessage(String chatRoomId, chatRoomMap) {
    Firestore.instance.collection("chatRoom")
        .document(chatRoomId)
    .collection("chats")
        .add(chatRoomMap)
        .catchError((e) => print(e.toString()));
  }

  getChats(String chatRoomId) async{
    return Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }
}
