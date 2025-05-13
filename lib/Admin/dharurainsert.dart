import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class Dharurainsert extends StatefulWidget {
  const Dharurainsert({super.key});

  @override
  State<Dharurainsert> createState() => _DharurainsertState();
}

class _DharurainsertState extends State<Dharurainsert> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? uploadimage;

  Future<void> choosImage() async {
    final XFile? chooseimage = await _picker.pickImage(source: ImageSource.gallery);
    if (chooseimage != null) {
      setState(() {
        uploadimage = File(chooseimage.path);
      });
    }
  }

  Future<void> uploadData() async {
    var uploadurl = Uri.parse('http://192.168.194.4/CHANGIA/dharurainsert.php');
    try {
      if (uploadimage == null) {
        print("Please select an image");
        return;
      }
      List<int> imageBytes = uploadimage!.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);
      var response = await http.post(uploadurl, body: {
        "name": name.text,
        "description": description.text,
        "image": baseimage,
      });
      if (response.statusCode == 200) {
        final jsondata = jsonDecode(response.body);
        if (jsondata["error"]) {
          print(jsondata["msg"]);
        } else {
          print("upload successfully");
          // Optionally clear the fields after successful upload
          setState(() {
            name.clear();
            description.clear();
            uploadimage = null;
          });
        }
      } else {
        print("Error during connection to the server: ${response.statusCode}");
      }
    } catch (e) {
      print("Error during connection to the server: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Add Dharura")),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: name,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Name",
                  hintText: "Dharura Name",
                  prefixIcon: Icon(Icons.title),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: description,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Dharura Description",
                  hintText: "Enter Dharura Description",
                  prefixIcon: Icon(Icons.text_snippet_outlined),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: uploadimage == null
                  ? const Text("No image selected")
                  : SizedBox(
                height: 150,
                child: Image.file(uploadimage!),
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  choosImage();
                },
                icon: const Icon(Icons.folder_open),
                label: const Text("CHOOSE IMAGE")),
            const SizedBox(height: 10),
            ElevatedButton.icon(
                onPressed: () {
                  uploadData();
                },
                icon: const Icon(Icons.upload),
                label: const Text("UPLOAD DATA"))
          ],
        ),
      ),
    );
  }
}