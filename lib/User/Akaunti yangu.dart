import 'package:flutter/material.dart';

class contactUs extends StatelessWidget{
  const contactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: ('ONTATCT WITH US'),
        home: Scaffold(
            body:  Center(
              child: Column(
                  children: <Widget>[
                    ListTile(
                        leading: Icon(Icons.person),
                        title: TextField(
                          decoration: InputDecoration(
                            hintText: "Email",
                          ),
                        )
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: TextField(
                        decoration: InputDecoration(
                          hintText: "Email",
                        ),
                      ),
                    ),
                    Divider(
                      height: 3,
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title:  Text('Birthday'),
                      subtitle: Text('January 1, 2000'),
                    ),
                    ListTile(
                      leading: Icon(Icons.group),
                      title: Text('Contact Group'),
                      subtitle: Text('Not specified'),
                    ),
                  ]
              ),
            )
        )
    );
  }
}
