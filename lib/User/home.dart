import 'package:flutter/material.dart';
import 'package:latifu/User/dharula.dart';
import 'package:latifu/admin/adminpanel.dart';
import 'changia.dart';
import 'miradi.dart';

class home extends StatelessWidget {
  const home({super.key});
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
              Image.asset('assets/images/3.jpg'),
              ListTile(
                title: const Text('Nyumbani'),
                trailing: const Icon(Icons.home),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const home())),
              ),
              ListTile(
                trailing: const Icon(Icons.person),
                title: const Text('Akaunti Yangu'),
                onTap: () => Navigator.pop,
              ),
              ListTile(
                  title: const Text('Miradi Yetu'),
                  trailing: const Icon(Icons.water),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Miradi()))),
              ListTile(
                  title: const Text('Dharura'),
                  trailing: const Icon(Icons.emergency_outlined),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => dharula()))),
              ListTile(
                  title: const Text('Changia'),
                  trailing: const Icon(Icons.volunteer_activism),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => changia()))),
              ListTile(
                title: const Text('Kuhusu Changia App'),
                trailing: const Icon(Icons.info),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChamgiaAdminPanel())),
              ),
              ListTile(
                title: const Text('ONDOKA'),
                trailing: const Icon(Icons.logout),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChamgiaAdminPanel())),
              ),
            ],
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(11.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/3.jpg'),
                  fit: BoxFit.cover,
                )),
            child: Container(
                margin:
                    const EdgeInsets.only(left: 101, right: 101, bottom: 102),
                child: Column(
                  children: <Widget>[
                    const SizedBox(width: 20.0),
                    const SizedBox(height: 300),
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
                                      builder: (context) => changia()));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5)),
                            child: const Text(
                              'CHANGIA SASA',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                        ]),
                      ),
                    )
                  ],
                ))));
  }
}
