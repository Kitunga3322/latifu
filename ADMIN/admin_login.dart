// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:latifu/adminPanel.dart';
// import 'package:latifu/home.dart';
// import 'adminPanel.dart';
// import 'adminPanel.dart';
// import 'adminPanel.dart';
// import 'admin_config.dart';
// import 'login.dart';
//
// class Admin extends StatefulWidget{
//    Admin({super.key});
//   final String title = "admin login";
//   authService authservice = authService();
//   @override
//   State<Admin> createState() => _AdminState();
// }
//
// class _AdminState extends State<Admin> {
//   TextEditingController AdminEmailController = TextEditingController();
//   TextEditingController AdminPasswordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   String? _email;
//   String? _password;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:Center(
//             child: Form(
//                 autovalidateMode: AutovalidateMode.always,
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       TextFormField(controller:authService().AdminEmail,
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: const InputDecoration(
//                               hintText: 'Andika email yako',
//                               labelText: 'Email',
//                               border: OutlineInputBorder()),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'andika email yako';
//                             }
//                             const pattern = r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$';
//                             final regExp = RegExp(pattern);
//                             if (!regExp.hasMatch(value)) {
//                               return 'samahan andika kwa usahihi email';
//                             }
//                             return null;
//                           }
//                       ),
//                       const SizedBox(height: 7),
//                       TextFormField(
//                           controller: authService().AdminPassword,
//                           obscureText: true,
//                           keyboardType: TextInputType.visiblePassword,
//                           decoration: const InputDecoration(
//                               hintText: 'andika password yako',
//                               labelText: 'Password',
//                               border: OutlineInputBorder()),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return ''
//                                   'andika password yako,';
//                             }
//                             else if (value.length < 3) {
//                               return 'password lazima iwe inaanzia tarakimu 4';
//                             }
//                           }
//                       ),
//                       Column(
//                         children: [
//                           ElevatedButton(
//                             onPressed: () async{
//                               var email =AdminEmailController.text;
//                               var password =AdminPasswordController.text;
//                               if(_formKey.currentState!.validate());
//                               var auth = FirebaseAuth.instance;
//                               var userCredential  = await auth.createUserWithEmailAndPassword(email: email, password: password);
//                               if(userCredential.user !=null){
//                                 Navigator.pushReplacement(
//                                     context, MaterialPageRoute(builder: (context)=> const login()));
//                                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Umekamilsha Kujisajili'),));
//                               }
//
//                             }, child: Text('today'),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//             )
//         )
//     );
//   }
// }
//
