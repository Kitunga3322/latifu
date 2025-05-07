// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// class Admini extends StatelessWidget{
// const Admini({super.key});y
// @override
// Widget build(BuildContext context){
// return Scaffold(body:Center(
// child:StreamBuilder<QuerySnapshot>(
// stream:FirebaseFirestore.instance.collection("ADMIN_LOGIN").snapshots(),
// builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>querySnapshot){
// if(querySnapshot.connectionState==ConnectionState.waiting){
// return CircularProgressIndicator();
// } else{
// final admin=querySnapshot.data?.docs;
// return ListView.builder(itemBuilder:((context,index){
// title:admin?[index]["email"];
// subtitle:admin?[index]["password"];}));
// }
// }
// )
// )
// );
// }
// }