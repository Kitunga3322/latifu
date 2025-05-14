import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:latifu/Admin/miradi/wagonjwalist.dart';
import 'package:latifu/Admin/miradi/wajanelist.dart';
import 'package:latifu/Admin/miradi/walemavulist.dart';
import 'package:latifu/Admin/miradi/yatimalist.dart';
class Allmiradi extends StatelessWidget {
  const Allmiradi({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MIRADI YETU"),
        centerTitle: true,
        backgroundColor: Colors.blue,),
      body: Padding(padding: const EdgeInsets.all(16.0),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, crossAxisSpacing: 16.0, mainAxisSpacing: 16.0, childAspectRatio: 1.0,),
          itemCount: _miradiData.length, itemBuilder: (context, index) {
            final MiradiData data = _miradiData[index];
            if (data.title == "WALEMAVU" ||
                data.title == "WATOTO YATIMA" ||
                data.title == "WAGONJWA" ||
                data.title == "WAJANE") {
              return _buildMiradiCard(context, data);
            } else {
              return const SizedBox.shrink();}},),),);}
  Widget _buildMiradiCard(BuildContext context, MiradiData data) {
    return Card(elevation: 8, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),),
      child: Padding(padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.center,
          children: [Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(data.imagePath, fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {return Container(
                      color: Colors.grey[200], alignment: Alignment.center,
                      child: const Text('Image Not Available', style: TextStyle(fontSize: 12), textAlign: TextAlign.center,
                      ),);},),),),
            const SizedBox(height: 8.0),
            Text(data.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0,),
              textAlign: TextAlign.center,),
            const SizedBox(height: 8.0),
            ElevatedButton(onPressed: () {
                _navigateToPage(context, data.title);
              }, style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),),
              child: const Text("CHEK TO ADD"),),],),),);}
  void _navigateToPage(BuildContext context, String title) {
    final Map<String, WidgetBuilder> routes = {
      "WALEMAVU": (context) => Walemavulist(),
      "WATOTO YATIMA": (context) => Yatimalist(),
      "WAGONJWA": (context) => Wagonjwalist(),
      "WAJANE": (context) => Wajanelist(),
    };
    final builder = routes[title];
    if (builder != null) {
      Navigator.push(context, MaterialPageRoute(builder: builder));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Page not found for $title')),);}}}

class MiradiData {
  final String imagePath;
  final String title;
  final String description;

  MiradiData({
    required this.imagePath,
    required this.title,
    required this.description,
  });}

final List<MiradiData> _miradiData = [
  MiradiData(
    imagePath: 'assets/images/ulemavu.jpg', title: "WALEMAVU",
    description: "Changia ili kuwasaidia walemavu kupata vifaa kama vile viti vya magurudumu.",
  ),
  MiradiData(
    imagePath: 'assets/images/yatima.jpg', title: "WATOTO YATIMA",
    description: "Saidia yatima kupata mahitaji muhimu na elimu.",
  ),
  MiradiData(
    imagePath: 'assets/images/wajane.jpg', title: "WAJANE",
    description: "Saidia wajane mahitaji muhimu",
  ),
  MiradiData(
    imagePath: 'assets/images/wagonjwa.jpg', title: "WAGONJWA",
    description: "Saidia wagonjwa mahitaji muhimu",),];



