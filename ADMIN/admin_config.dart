// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:next/home.dart';
//
// import 'admin.dart';
// class authService {
//   final auth = FirebaseAuth.instance;
//   TextEditingController AdminEmail = TextEditingController();
//   TextEditingController AdminPassword = TextEditingController();
//   final firestore = FirebaseFirestore.instance;
//
//   void Adminlogin(context) async {
//     showDialog(context: context, builder: (context) {
//       return AlertDialog(
//         title: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     });
//     await FirebaseFirestore.instance.collection("admin")
//         .doc("Adminlogin")
//         .snapshots()
//         .forEach((element) {
//       if (element.data()?['AdminEmail'] == AdminEmail.text &&
//           element.data()?['AdminPassword'] == AdminPassword.text) {
//         Navigator.pushAndRemoveUntil(
//             context, MaterialPageRoute(builder: (context) => Admini()), (
//             route) => false);
//       }
//     }).catchError((e) {
//       showDialog(context: context, builder: (context) {
//         return AlertDialog(
//           title: Text("Error message"),
//           content: Text(e.toString()),
//         );
//       });
//     });
//   }
// }