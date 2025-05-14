import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:latifu/Admin/miradi/walemavuinsert.dart';


class Walemavulist extends StatefulWidget {
  Walemavulist({super.key});
  @override
  State<Walemavulist> createState() => _WalemavulistState();
}

class _WalemavulistState extends State<Walemavulist> {
  late List<dynamic> Wajanedata = [];

  Future<void> getdharuraData() async {
    try {
      final response = await http.post(Uri.parse('http://192.168.69.4/CHANGIA/walemavulist.php'));
      if (response.statusCode == 200) {
        setState(() {
          Wajanedata = jsonDecode(response.body);
        });} else {
        print("Failed to load Dharura data: ${response.statusCode}");
      }} catch (e) {
      print("Error fetching Dharura data: $e");
    }}

  @override
  void initState() {
    super.initState();
    getdharuraData();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WALEMAVU"), centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => const Walemavuinsert(),),);},
            icon: const Icon(
              Icons.add_circle_outline_sharp, color: Colors.white,
            ),),],),
      body: FutureBuilder<void>(future: null, // Data is fetched in initState
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (Wajanedata.isNotEmpty) {
            return ListView.builder(
              itemCount: Wajanedata.length,
              itemBuilder: (BuildContext context, int index) {
                final String imageUrl = 'http://192.168.69.4/CHANGIA/${Wajanedata[index]["image"]}'; // Corrected URL
                return Card(
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.indigo, clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(imageUrl, fit: BoxFit.fill, width: double.infinity, height: 200, errorBuilder: (context, error, stackTrace) {return SizedBox(height: 200, width: double.infinity, child: const Center(
                        child: Text('Failed to load image'),
                      ),
                      );
                      },),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text('${Wajanedata[index]["name"]}: ${Wajanedata[index]["description"]}',
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16,),),),],),);},);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
