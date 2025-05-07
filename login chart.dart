import 'package:flutter/material.dart';
import 'package:latifu/register.dart';

import 'home.dart';

  class LoginScreen extends StatefulWidget {
    @override
    _LoginScreenState createState() => _LoginScreenState();
  }

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // App Logo (Replace with your actual logo)
              Container(
                child: Center(
                  child: Icon(
                    Icons.volunteer_activism,
                    size: 150,
                  ),
                ),
              ),
              Text(
                'KARIBU CHANGIA APP',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24.0),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: 8.0),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => home())
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreenAccent, // Match the image color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'INGIA',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                 Navigator.push(
                   context, MaterialPageRoute(builder: (context) => RegisterScreen())
                 );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent, // Match the image color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'JISAJILI',
                  style: TextStyle(color: Colors.white),
                ),
              ),
      ]
    )
      )
    )
    );
  }
}


