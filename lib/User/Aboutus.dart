import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Changia App'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Kuhusu Changia App',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Karibu Changia, jukwaa lako la kuunganisha na kusaidia sababu zenye maana. Tunaamini katika nguvu ya jamii na athari ya hatua za pamoja. Changia inalenga kurahisisha watu binafsi na mashirika kuchangisha fedha na kuongeza ufahamu kwa miradi inayofanya mabadiliko.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Lengo Letu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Lengo letu ni kuwezesha watu binafsi na mashirika kuleta mabadiliko chanya kwa kutoa jukwaa rahisi kutumia na lenye uwazi kwa uchangishaji wa fedha na ushiriki wa jamii. Tunajitahidi kujenga dunia ambapo kila mtu ana fursa ya kuchangia sababu wanazozijali.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Maono Yetu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Kuwa jukwaa linaloongoza ambalo linakuza utamaduni wa utoaji na usaidizi wa jamii, likisukuma mabadiliko endelevu na yenye matokeo makubwa duniani kote.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Timu Yetu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildTeamMember(
                  'Sir.Saidi Chang^a',
                  'CEO',
                  'Sir,Saidi Ndio msimamizi mkuu wa programu zote za Changia App.',
                  'assets/images/3.jpg', // Replace with your image path
                ),
                _buildTeamMember(
                  'Latifu Ibrahim',
                  'Msanidi Programu',
                  'Latifu: Ni mwandishi wa programu mwenye ujuzi aliye jitolea kuunda uzoefu wa programu hii na ujuzi juu ya usalama kwa watumiaji wote wa Changia App.',
                  'assets/images/tifu.png', // Replace with your image path
                ),
                const SizedBox(height: 24),
                const Text(
                  'Wasiliana Nasi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Column(
                  children: [
                    Text(
                      'Ikiwa una maswali au maoni yoyote, tafadhali usisite luwasiliana nasi kupitia njia zifuatazo.',
                      style: TextStyle(fontSize: 16),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('NAMBA ZA SIMU'),
                      subtitle: Text('+255625499294'),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('ANUANI'),
                      subtitle: Text('MABIBO DAR_ES_SALAAM'),
                    ),
                    Divider(
                      height: 20,
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('BARUA PEPE'),
                      subtitle: Text('latifuibrahim64@gmail.com'),
                    ),
                    Divider(
                      height: 20,
                    ),
                  ],
                ),
              ]),
        ));
  }

  Widget _buildTeamMember(
      String name, String title, String description, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imagePath),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
