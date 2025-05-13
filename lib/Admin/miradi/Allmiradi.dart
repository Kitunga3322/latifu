import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:latifu/Admin/miradi/wagonjwa.dart';
import 'package:latifu/Admin/miradi/walemavu.dart';
import 'package:latifu/Admin/miradi/yatima.dart';
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
      "WALEMAVU": (context) => Ulemavu(),
      "WATOTO YATIMA": (context) => Yatima(),
      "WAGONJWA": (context) => Wagonjwa(),
      "WAJANE": (context) => wajane(),
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

class Ulemavu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ADD WALEMAVU'),
        actions: <Widget>[
        IconButton(onPressed: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>  walemavu(),
        ),);},
    icon: const Icon(Icons.add_circle_outline_sharp,
    color: Colors.white,),),],),
      body: Center(child: Text("kitunga"),),);}}

class Yatima extends StatefulWidget {
  Yatima({super.key});
  @override
  State<Yatima> createState() => _YatimaState();
  }
  class _YatimaState extends State<Yatima> {
  late List<dynamic> Wajanedata = [];

  Future<void> getdharuraData() async {
  try {
  final response = await http.post(Uri.parse('http://192.168.208.4/CHANGIA/dharuralist.php'));
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
  return Scaffold(appBar: AppBar(title: const Text("WAGONJWA"), centerTitle: true,
  actions: <Widget>[
  IconButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(
  builder: (BuildContext context) => const wagonjwa(),),);},
  icon: const Icon(Icons.add_circle_outline_sharp, color: Colors.white,),),],),
  body: FutureBuilder<void>(
  future: null, builder: (context, AsyncSnapshot<void> snapshot) {
  if (Wajanedata.isNotEmpty) {
  return ListView.builder(itemCount: Wajanedata.length, itemBuilder: (BuildContext context, int index) {
  final String imageUrl = 'http://192.168.194.4/CHANGIA/${Wajanedata[index]["image"]}'; // Corrected URL
  return Card(shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
  color: Colors.indigo, clipBehavior: Clip.antiAliasWithSaveLayer,
  margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 24),
  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
  children: [Image.network(
  imageUrl, fit: BoxFit.fill, width: double.infinity, height: 200,
  errorBuilder: (context, error, stackTrace) {
  return SizedBox(height: 200, width: double.infinity, child: const Center(
  child: Text('Failed to load image'),),);},),
  Padding(padding: const EdgeInsets.all(15.0),
  child: Text('${Wajanedata[index]["name"]}: ${Wajanedata[index]["description"]}',
  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16,),),),],),);},);
  } else if (snapshot.connectionState == ConnectionState.waiting) {
  return const Center(child: CircularProgressIndicator());
  } else {
  return const Center(child: Text('No data available.'));
  }},),);}}

  class wajane extends StatefulWidget {
  wajane({super.key});
  @override
  State<wajane> createState() => _wajaneState();
}
class _wajaneState extends State<wajane> {
  late List<dynamic> Wajanedata = [];

  Future<void> getdharuraData() async {
    try {
      final response = await http.post(Uri.parse('http://192.168.208.4/CHANGIA/dharuralist.php'));
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
        title: const Text("WAGONJWA"), centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const wagonjwa(),),);},
            icon: const Icon(Icons.add_circle_outline_sharp, color: Colors.white,),),],),
      body: FutureBuilder<void>(future: null, // Data is fetched in initState
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (Wajanedata.isNotEmpty) {
            return ListView.builder(itemCount: Wajanedata.length, itemBuilder: (BuildContext context, int index) {
                final String imageUrl = 'http://192.168.208.4/CHANGIA/${Wajanedata[index]["image"]}'; // Corrected URL
                return Card
                  (shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.indigo, clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 24),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(imageUrl, fit: BoxFit.fill, width: double.infinity, height: 200, errorBuilder: (context, error, stackTrace) {return SizedBox(height: 200, width: double.infinity, child: const Center(
                              child: Text('Failed to load image'),),);},),
                      Padding(padding: const EdgeInsets.all(15.0),
                        child: Text('${Wajanedata[index]["name"]}: ${Wajanedata[index]["description"]}',
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16,),),),],),);},);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('No data available.'));
          }},),);}}

class Wagonjwa extends StatefulWidget {
  const Wagonjwa({super.key});

  @override
  State<Wagonjwa> createState() => _WagonjwaState();
}

class _WagonjwaState extends State<Wagonjwa> {
  late List<dynamic> Wagonjwadata = [];

  Future<void> getWagonjwadata() async {
    try {
      final response = await http.post(Uri.parse('http://192.168.208.4/CHANGIA/dharuralist.php'));
      if (response.statusCode == 200) {
        setState(() {
          Wagonjwadata = jsonDecode(response.body);
        });
      } else {
        print("Failed to load Dharura data: ${response.statusCode}");
              }
    } catch (e) {
      print("Error fetching Dharura data: $e");
          }}
  @override
  void initState() {
    super.initState();
    getWagonjwadata();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("WAGONJWA"), centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const wagonjwa(),),);},
            icon: const Icon(
              Icons.add_circle_outline_sharp, color: Colors.white,),),],),
      body: FutureBuilder<void>(
        future: null, // Data is fetched in initState
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (Wagonjwadata.isNotEmpty) {
            return ListView.builder(
              itemCount: Wagonjwadata.length,
              itemBuilder: (BuildContext context, int index) {
                final String imageUrl = 'http://192.168.208.4/CHANGIA/${Wagonjwadata[index]["image"]}'; // Corrected URL
                return Card(
                  shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.indigo, clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 10, right: 24),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(imageUrl, fit: BoxFit.fill, width: double.infinity, height: 200,
                        errorBuilder: (context, error, stackTrace) {
                          return SizedBox(height: 200, width: double.infinity,
                            child: const Center(child: Text('Failed to load image'),),);},),
                      Padding(padding: const EdgeInsets.all(15.0), child: Text('${Wagonjwadata[index]["name"]}: ${Wagonjwadata[index]["description"]}',
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16,),),),],),);},);
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text('No data available.'));
          }},),);}}