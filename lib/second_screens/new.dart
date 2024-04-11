// // ignore_for_file: implementation_imports, unnecessary_import, use_key_in_widget_constructors, prefer_interpolation_to_compose_strings, avoid_unnecessary_containers, non_constant_identifier_names, avoid_print, prefer_final_fields, unused_field, library_private_types_in_public_api

// import 'dart:convert';
// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/material/icons.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:green/second_screens/neee.dart';

// class MomentsScreen extends StatefulWidget {
//   final int schoolid;
//   final String busroute;
//   final int userId;
//   final String username;
//   final String accessToken;
//   final int stuno;
//   final String contact_no;
//   final int classno;
//   final String classname;
//   final String emailaddress;
  
//   const MomentsScreen(
//       {required this.busroute,
//       required this.userId,
//       required this.username,
//       required this.stuno,
//       required this.accessToken,
//       required this.contact_no,
//       required this.classno,
//       required this.classname,
//       required this.emailaddress, 
//       required this.schoolid});
//   @override
//   _MomentsScreen createState() => _MomentsScreen();
// }

// class _MomentsScreen extends State<MomentsScreen> {
//   int _currentIndex = 0;
//   bool visibilityTag = false;
//   // var moments = new List<MomentResponse>();
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//   late Stream<QuerySnapshot> stuMoments;

//   _getChat() {
//     _firebaseMessaging.getToken().then((token) {
//       print("Device Token:$token");
//     });
//     String clasroom = "transport";
//     DatabaseMethods().getMoments(transport).then((val) {
//       setState(() {
//         stuMoments = val;
//       });
//     });
//   }

//   /*_moments_fn() {
//     APIServices.getmomentdata().then((response) {
//       if (response.statusCode == 200) {
//         String rep = response.body.toString();
//         Map<String, dynamic> data_ = jsonDecode(rep);
//         setState(() {
//           Iterable listarray = data_['response'];
//           moments = listarray.map((e) => MomentResponse.fromJson(e)).toList();
//         });
//       } else {
//         print('Request failed with status');
//       }
//     });
//   }*/

//   @override
//   initState() {
//     if (widget.usertype == '2' || widget.usertype == '3') {
//       visibilityTag = true;
//     }
//     MomentsScreen.delVisible = visibilityTag;
//     MomentsScreen.sclid = widget.schoolid.toString();
//     MomentsScreen.proftype = widget.usertype;
//     MomentsScreen.schoolclassno = widget.classno.toString();
//     // when the class loads the initial function calling happens here
//     _getChat();
//     super.initState();
//     //_moments_fn();
//   }

//   Future<String> get_data(doc_ref) async {
//     DocumentSnapshot docSnap = await doc_ref.get();
//     var doc_id2 = docSnap.reference.documentID;
//     return doc_id2;
//   }

//   Widget loadMoments() {
//     return StreamBuilder(
//       stream: stuMoments,
//       builder: (context, snapshot) {
//         return snapshot.hasData
//             ? ListView.builder(
//                 itemCount: snapshot.data.documents.length,
//                 itemBuilder: (context, index) {
//                   var docid = snapshot.data.documents[index];
//                   String docn = docid.documentID;
//                   return MomentsList(
//                       momtitle:
//                           snapshot.data.documents[index].data["mometTitle"],
//                       momDec: snapshot
//                           .data.documents[index].data["mometDescription"],
//                       imgpath: snapshot.data.documents[index].data["imgurl"],
//                       noticedoc: docn);
//                 })
//             : Container();
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Moments'),
//         leading: IconButton(
//             icon: const Icon(Icons.home),
//             color: Colors.white,
//             onPressed: () {
//               Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(
//                       builder: (BuildContext context) => DashboardScreen(
//                             schoolid: widget.schoolid,
//                             userId: widget.userId,
//                             usertype: widget.usertype,
//                             username: widget.username,
//                             stuno: widget.stuno,
//                             accessToken: widget.accessToken,
//                             contact_no: widget.contact_no,
//                             classno: widget.classno,
//                             classname: widget.classname,
//                             emailaddress: widget.emailaddress,
//                           )),
//                   (Route<dynamic> route) => false);
//             }),
//         actions: <Widget>[
//           visibilityTag
//               ? IconButton(
//                   icon: const Icon(
//                     Icons.add_a_photo,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {
//                     Navigator.of(context).pushAndRemoveUntil(
//                         MaterialPageRoute(
//                             builder: (BuildContext context) => AddMoments(
//                                   schoolid: widget.schoolid,
//                                   userId: widget.userId,
//                                   usertype: widget.usertype,
//                                   username: widget.username,
//                                   stuno: widget.stuno,
//                                   accessToken: widget.accessToken,
//                                   contact_no: widget.contact_no,
//                                   classno: widget.classno,
//                                   classname: widget.classname,
//                                   emailaddress: widget.emailaddress,
//                                 )),
//                         (Route<dynamic> route) => false);
//                   },
//                 )
//               : Container()
//         ],
//       ),
//       body: Container(
//         child: Stack(
//           children: [
//             loadMoments(),
//             const SizedBox(height: 100),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MomentsList extends StatelessWidget {
//   final String momtitle;
//   final String momDec;
//   final String imgpath;
//   final String noticedoc;

//   const MomentsList(
//       {required this.momtitle,
//       required this.momDec,
//       required this.imgpath,
//       required this.noticedoc});
//   deleteSchoolMoments(notoDoc) async {
//     String clasroom =
//         "school_" + MomentsScreen.sclid + "_" + MomentsScreen.schoolclassno;
//     DatabaseMethods().deleteMoments(notoDoc, clasroom);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return //ListTile(title: Text(moments[index].moment_title)
//         Card(
//       elevation: 3.0,
//       color: Colors.white,
//       margin: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           const SizedBox(
//             height: 0.0,
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(top: 5, left: 10),
//                 child: Text(momtitle,
//                     style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue)),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 5, left: 10),
//                 child: Text(momDec, style: const TextStyle(fontSize: 14)),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10.0,
//           ),
//           Image.network(
//             imgpath,
//             fit: BoxFit.cover,
//           ),
//           MomentsScreen.delVisible
//               ? Padding(
//                   padding: const EdgeInsets.only(top: 0, left: 10),
//                   child: IconButton(
//                       icon: const Icon(
//                         Icons.delete,
//                         color: Colors.blue,
//                         size: 30,
//                       ),
//                       onPressed: () {
//                         deleteSchoolMoments(noticedoc);
//                       }))
//               : Container(),
//         ],
//       ),
//     );
//   }
// }
