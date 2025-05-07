import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:latifu/apiConnection.dart';

class RegisterFetch extends StatefulWidget {
  const RegisterFetch({super.key});

  @override
  RegisterFetchState createState() => RegisterFetchState();
}

class RegisterFetchState extends State<RegisterFetch> {
  List userdata = [];

  Future<void> getrecords() async {
    try {
      var response = await http.get(Uri.parse(Api.registerFetch));
      if (response.statusCode == 200) {
        setState(() {
          userdata = jsonDecode(response.body);
        });
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load users.')),
        );
      }
    } catch (e) {
      print('Error fetching data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error loading users.')),
      );
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      final response = await http.delete(
        Uri.parse(
            '${Api.deleteuserregister}/$userId'), // Assuming your delete endpoint requires the user ID
      );
      if (response.statusCode == 200) {
        // Deletion successful, now refresh the user list
        await getrecords();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User deleted successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to delete user.')),
        );
        print('Failed to delete user. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting user: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User deleted successfully!')),
      );
    }
  }

  @override
  void initState() {
    getrecords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("USERS"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: userdata.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(userdata[index]["username"]),
            subtitle: Text(userdata[index]["email"]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm Delete"),
                      content: const Text(
                          "Are you sure you want to delete this user?"),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Cancel"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          style:
                              TextButton.styleFrom(foregroundColor: Colors.red),
                          child: const Text("Delete"),
                          onPressed: () {
                            deleteUser(userdata[index]["id"]
                                .toString()); // Replace "id" with your user ID key
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
