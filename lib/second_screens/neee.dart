// import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseMethods {
//   getMoments(String chatRoomId) async {
//     return FirebaseFirestore.instance
//         .collection("transport")
//         .document(chatRoomId)
//         .collection("moments")
//         .orderBy('time')
//         .snapshots();
//   }

//   void deleteMoments(notoDoc, String clasroom) {}
// }