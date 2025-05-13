// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart' as path;
// import 'package:async/async.dart';
//
// import '../ApiConnection.dart';  // Import the async package
//
// // Assuming your server IP is 10.0.2.2 for Android emulator,  for iOS use 127.0.0.1
// const String baseUrl = 'http://10.0.2.2/your_upload_directory/upload.php'; //  <- CHANGE THIS
//
// class UploadImagePage extends StatefulWidget {
//   @override
//   _UploadImagePageState createState() => _UploadImagePageState();
// }
//
// class _UploadImagePageState extends State<UploadImagePage> {
//   final TextEditingController captionController = TextEditingController();
//   final ImagePicker picker = ImagePicker();
//   File? _imageFile;
//   bool _isUploading = false;
//   String _message = ''; // Add a message variable for feedback
//
//   Future<void> pickImage() async {
//     final picked = await picker.pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() {
//         _imageFile = File(picked.path);
//         _message = ''; // Clear previous message
//       });
//     } else {
//       setState(() {
//         _message = 'No image selected';
//       });
//     }
//   }
//
//   Future<void> uploadImage() async {
//     if (_imageFile == null || captionController.text.isEmpty) {
//       setState(() {
//         _message = 'Please select an image and enter a caption.';
//       });
//       return;
//     }
//
//     setState(() {
//       _isUploading = true;
//       _message = 'Uploading...'; // Set uploading message
//     });
//
//     try {
//       //var request = http.MultipartRequest('POST', Uri.parse(Api.dharuradata)); // Use the baseUrl constant
//
//      // request.fields['caption'] = captionController.text.trim();
//
//       var stream = http.ByteStream(DelegatingStream.typed(_imageFile!.openRead())); // Use DelegatingStream
//       var length = await _imageFile!.length();
//
//       var multipartFile = http.MultipartFile(
//         'image', // This should match the key your PHP script expects ('image')
//         stream,
//         length,
//         filename: path.basename(_imageFile!.path),
//       );
//
//      // request.files.add(multipartFile);
//
//       // Send the request and get the response.
//      // var response = await request.send();
//      // var responseBody = await response.stream.bytesToString();
//       var decodedResponse = jsonDecode(responseBody);
//
//      // if (response.statusCode == 200) {
//         if (decodedResponse['success'] == true) {
//           setState(() {
//             _message = 'Upload successful!';
//             captionController.clear();
//             _imageFile = null;
//           });
//           // Show the message
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(_message),
//               duration: Duration(seconds: 3),
//             ),
//           );
//         } else {
//           setState(() {
//             _message = 'Upload failed: ${decodedResponse['message']}';
//           });
//           // Show the message
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               content: Text(_message),
//               duration: Duration(seconds: 3),
//             ),
//           );
//         }
//       } else {
//         setState(() {
//           _message = 'Server error: ${response.statusCode}';
//         });
//         // Show the message
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(_message),
//             duration: Duration(seconds: 3),
//           ),
//         );
//       }
//     } catch (e) {
//       setState(() {
//         _message = 'Error uploading image: $e';
//       });
//       // Show the message
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(_message),
//           duration: Duration(seconds: 3),
//         ),
//       );
//     } finally {
//       setState(() {
//         _isUploading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Upload Image')),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
//           child: Column(
//             children: [
//               TextField(
//                 controller: captionController,
//                 decoration: const InputDecoration(
//                   labelText: 'Caption',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               _imageFile == null
//                   ? const Text('No image selected')
//                   : Image.file(_imageFile!, height: 200),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _isUploading ? null : pickImage,
//                 child: const Text('Pick Image'),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _isUploading ? null : uploadImage,
//                 child: _isUploading
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : const Text('Upload'),
//               ),
//               const SizedBox(height: 20),
//               Text(_message, style: TextStyle(color: _isUploading ? Colors.blue : Colors.red)), //show message.
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
