import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:latifu/apiConnection.dart';
import 'package:path/path.dart' as path;

class UploadImagePage extends StatefulWidget {
  @override
  _UploadImagePageState createState() => _UploadImagePageState();
}

class _UploadImagePageState extends State<UploadImagePage> {
  final TextEditingController captionController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  File? _imageFile;
  bool _isUploading = false;

  Future<void> pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  Future<void> uploadImage() async {
    if (_imageFile == null || captionController.text.isEmpty) {
      _showMessage("Please select an image and enter a caption.");
      return;
    }

    setState(() => _isUploading = true);

    try {
      var uri =  Uri.parse(Api.dharura); // Replace with your actual PHP script URL

      var request = http.MultipartRequest('POST', uri);
      request.fields['caption'] = captionController.text;

      var stream = http.ByteStream(_imageFile!.openRead());
      var length = await _imageFile!.length();

      var multipartFile = http.MultipartFile(
        'image',
        stream,
        length,
        filename: path.basename(_imageFile!.path),
      );
      request.files.add(multipartFile);

      var response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        final decoded = jsonDecode(responseBody);
        if (decoded['success'] == 'true') {
          _showMessage('Upload successful!');
          setState(() {
            captionController.clear();
            _imageFile = null;
          });
        } else {
          _showMessage('Upload failed: ${decoded['message']}');
        }
      } else {
        _showMessage('Server error: ${response.statusCode}');
      }
    } catch (e) {
      _showMessage('Upload error: $e');
    } finally {
      setState(() => _isUploading = false);
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Image')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: captionController,
              decoration: InputDecoration(
                labelText: 'Caption',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            _imageFile == null
                ? Text('No image selected')
                : Image.file(_imageFile!, height: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isUploading ? null : uploadImage,
              child: _isUploading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text('Upload'),
            )
          ],
        ),
      ),
    );
  }
}