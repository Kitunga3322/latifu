import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:latifu/Admin/miradi/yatimainsert.dart';

class Yatimalist extends StatefulWidget {
  Yatimalist({super.key});
  @override
  State<Yatimalist> createState() => _YatimalistState();
}

class _YatimalistState extends State<Yatimalist> {
  late List<dynamic> yatimadata = [];
  Future<void> getyatimaData() async {
    try {
      final response = await http.post(Uri.parse('http://192.168.69.4/CHANGIA/yatimalist.php'));
      if (response.statusCode == 200) {
        setState(() {
          yatimadata = jsonDecode(response.body);
        });} else {
        print("Failed to load yatima data: ${response.statusCode}");
      }} catch (e) {
      print("Error fetching yatima data: $e");
    }}
  @override
  void initState() {
    super.initState();
    getyatimaData();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("YATIMA"), centerTitle: true,
      actions: <Widget>[
        IconButton(onPressed: () {Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => const yatimainsert()
          ,),
           );
          },
          icon: const Icon(Icons.add_circle_outline_sharp, color: Colors.white,),),],),
      body: FutureBuilder<void>(
        future: null, builder: (context, AsyncSnapshot<void> snapshot) {
        if (yatimadata.isNotEmpty) {
          return ListView.builder(itemCount: yatimadata.length,
            itemBuilder: (BuildContext context, int index) {
            final String imageUrl = 'http://192.168.69.4/CHANGIA/${yatimadata[index]["image"]}'; // Corrected URL
            return Card(
              shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: Colors.indigo, clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                  imageUrl, fit: BoxFit.fill, width: double.infinity, height: 200,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(height: 200, width: double.infinity, child: const Center(
                      child: Text('Failed to load image'),
                    ),);},),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('${yatimadata[index]["name"]}: ${yatimadata[index]["description"]}',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16,),),),],),);},);
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('No data available.'));
        }},),);}}
