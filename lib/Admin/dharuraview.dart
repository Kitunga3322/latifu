import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latifu/apiConnection.dart';

class dharuraview extends StatefulWidget {
  const dharuraview({super.key});

  @override
  State<dharuraview> createState() => _dharuraviewState();
}

class _dharuraviewState extends State<dharuraview> {
  List record = [];

  Future<void> imageformdb() async {
    try {
      var response = await http.get(Uri.parse(Api.registerFetch));
      record = jsonDecode(response.body);
      setState(() {
        record = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  @override
  void initState() {
    imageformdb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("View from database"),
        ),
        body: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: record.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                        child: Expanded(
                            child: Image.network("http://localhost/CHANGIA/" +
                                record[index]["image_path"]))),
                    Container(
                      child: Text(record[index]["caption"]),
                    )
                  ],
                ),
              );
            }));
  }
}
