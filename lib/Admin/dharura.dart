import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:latifu/Admin/dharuraview.dart';
import 'package:latifu/apiConnection.dart';
import 'package:path/path.dart' as path; // Import the path package

class dharura extends StatefulWidget {
  const dharura({super.key});

  @override
  dharuraState createState() => dharuraState();
}

class dharuraState extends State<dharura> {
  TextEditingController captionController = TextEditingController();
  File? imageFile;
  String? imageName;
  String? imageData;
  final ImagePicker _imagePicker = ImagePicker();
  bool _isUploading =
      false; // Track upload state to disable button during upload.

  //Handles the image selection process
  Future<void> _getImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        imageName = path.basename(pickedFile.path); // Use path.basename
      });
    } else {
      print('No image selected.'); //Important
    }
  }

  //Handles the image upload process
  Future<void> _uploadImage() async {
    if (imageFile == null) {
      // Show a user-friendly message.  Use a dialog, not print.
      _showErrorDialog("Please select an image to upload.");
      return;
    }

    if (captionController.text.isEmpty) {
      _showErrorDialog("Please enter a caption for the image.");
      return;
    }

    setState(() {
      _isUploading =
          true; // Disable the upload button while uploading.  VERY IMPORTANT
    });

    try {
      // Read the image file as bytes
      List<int> imageBytes = await imageFile!.readAsBytes();
      // Encode the bytes to base64
      base64Encode(imageBytes);

      var request = http.MultipartRequest('POST', Uri.parse(Api.dharura));
      // Add the text fields
      request.fields['caption'] = captionController.text;
      //add the image
      var stream = http.ByteStream(imageFile!.openRead());
      var length = await imageFile!.length();
      var multipartFile = http.MultipartFile('image', stream, length,
          filename: imageName); //use image name here
      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var decodedResponse = jsonDecode(responseBody);
        if (decodedResponse["success"] == "true") {
          _showSuccessDialog("Image uploaded successfully!");
          // Clear the form
          setState(() {
            captionController.clear();
            imageFile = null;
            imageName = null;
          });
        } else {
          _showErrorDialog(
              "Failed to upload image.  Server responded with: ${decodedResponse["message"] ?? 'Unknown error'}"); // Show the server's error message if available.
          print('Server error: ${decodedResponse["message"]}');
        }
      } else {
        _showErrorDialog(
            "Failed to upload image.  Status code: ${response.statusCode}");
        print('HTTP error: ${response.statusCode}');
      }
    } catch (e) {
      _showErrorDialog("Error uploading image: $e");
      print('Error uploading image: $e');
    } finally {
      setState(() {
        _isUploading =
            false; // Re-enable the upload button after completion (success or failure).
      });
    }
  }

  //show error message
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  //show success message
  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Image"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Make the form scrollable
          child: Column(
            children: [
              TextField(
                controller: captionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Caption",
                ),
              ),
              const SizedBox(height: 20),
              //show selected image
              if (imageFile != null) Image.file(imageFile!),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _getImage,
                child: const Text("Choose image"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isUploading ? null : _uploadImage,
                child: _isUploading
                    ? const CircularProgressIndicator()
                    : const Text("Upload "),
              ),
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => dharuraview()));
                    },
                    child: Text("view data"));
              })
            ],
          ),
        ),
      ),
    );
  }
}
