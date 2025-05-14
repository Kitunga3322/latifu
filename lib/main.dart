import 'package:flutter/material.dart';
import 'package:latifu/User/Aboutus.dart';
import 'package:latifu/User/changia.dart';
import 'package:latifu/admin/adminpanel.dart';
import 'User/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CHANGIA APP'),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              Image.asset('assets/images/2.jpg'),
              ListTile(
                title: const Text('changia'),
                trailing: const Icon(Icons.volunteer_activism),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => changia())),
              ),
              ListTile(
                title: const Text('Kuhusu Changia App'),
                trailing: const Icon(Icons.info),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsPage()),
                ),
              ),
              ListTile(
                  title: const Text('INGIA'),
                  trailing: const Icon(Icons.login),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChamgiaAdminPanel()))),
            ],
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(11.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/2.jpg'),
                )),
            child: Container(
                margin: const EdgeInsets.only(left: 20, right: 10, bottom: 20),
                child: Column(children: <Widget>[
                  const SizedBox(width: 10.0),
                  const SizedBox(height: 100),
                  Expanded(
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(children: <Widget>[
                            Expanded(
                                child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5)),
                              child: const Text(
                                'Ingia',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                          ])))
                ]))));
  }
}
