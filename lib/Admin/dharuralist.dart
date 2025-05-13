import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dharurainsert.dart';

class DharuraList extends StatefulWidget {
  const DharuraList({super.key});

  @override
  State<DharuraList> createState() => _DharuraListState();
}

class _DharuraListState extends State<DharuraList> {
  late List<dynamic> dharuradata = [];

  Future<void> getdharuraData() async {
    try {
      // Assuming Api.dharuralist contains the correct URL to fetch data
      final response = await http.post(Uri.parse('http://192.168.194.4/CHANGIA/dharuralist.php'));
      if (response.statusCode == 200) {
        setState(() {
          dharuradata = jsonDecode(response.body);
        });
      } else {
        print("Failed to load Dharura data: ${response.statusCode}");
        // Consider showing a user-friendly error message here
      }
    } catch (e) {
      print("Error fetching Dharura data: $e");
      // Consider showing a user-friendly error message here
    }
  }

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
        title: const Text("MIRADI"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const Dharurainsert(),
                ),
              );
            },
            icon: const Icon(
              Icons.add_circle_outline_sharp,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder<void>(
        future: null, // Data is fetched in initState
        builder: (context, AsyncSnapshot<void> snapshot) {
          if (dharuradata.isNotEmpty) {
            return ListView.builder(
              itemCount: dharuradata.length,
              itemBuilder: (BuildContext context, int index) {
                // Construct the image URL using the same base URL as the data fetch
                final String imageUrl =
                    'http://192.168.194.4/CHANGIA/${dharuradata[index]["image"]}'; // Corrected URL

                return Card(
                  shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.indigo,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 10, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        imageUrl, // Use the constructed URL
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 200,
                        errorBuilder: (context, error, stackTrace) {
                          // Improved error handling: show a placeholder
                          return SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: const Center(
                              child: Text('Failed to load image'),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '${dharuradata[index]["name"]}: ${dharuradata[index]["description"]}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            // Consider showing a more informative message if no data is available
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}

