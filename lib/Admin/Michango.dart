import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dharura.dart';

class michango extends StatefulWidget {
  const michango({super.key});

  @override
  State<michango> createState() => _michangoState();
}

class _michangoState extends State<michango> {
 @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar:  AppBar(
       title: Text("MICHANGO ILIYO POKELEWA",style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),),
     ),
   );
}
}