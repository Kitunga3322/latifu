import 'package:flutter/material.dart';

class Miradi extends StatelessWidget {
  const Miradi({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CHANGIA KWENYE MIRADI YETU"),
          centerTitle: true,
        ),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(61.0),
                children: <Widget>[
                  Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        Image.asset("images/imergence.jpg"),
                        const Text('DHARURA'),
                        TextButton(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => home()));
                            },
                            child: const Text("CHANGIA")),
                      ],
                    ),
                  ),
                  Card(
                    elevation: 16,
                    child: Column(
                      children: [
                        Image.asset("images/yatima.jpg"),
                        const Text('WATOTO YATIMA'),
                        const Text(
                            'Karibu Changia, jukwaa lako la kuunganisha na kusaidia sababu zenye maana. Tunaamini katika nguvu ya jamii na athari ya hatua za pamoja. Changia inalenga kurahisisha watu binafsi na mashirika kuchangisha fedha na kuongeza ufahamu kwa miradi inayofanya mabadiliko.'),
                        TextButton(
                            onPressed: () {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) => Albino()));
                            },
                            child: const Text("CHANGIA")),
                      ],
                    ),
                  ),
                  Card(
                      elevation: 16,
                      child: Column(
                        children: [
                          Image.asset("images/ulemavu.jpg"),
                          const Text(
                              'KUNA MAHITAJI MAKUBWA YA VITI KWA AJILI YA WALEMAVU WA MIGUU PIA MIKONO PIA WATU HAWA WANAHITAJI MSAADA MKUBWA KUTOKA KWETU UNAWEZA KUWASAIDIA WALEMAVU HAWA KAMA IFUATAVYO'),
                          TextButton(
                              onPressed: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => ulemavu()));
                              },
                              child: const Text("CHANGIA")),
                        ],
                      )),
                  Card(
                      elevation: 16,
                      child: Column(
                        children: [
                          Image.asset("images/albino.jpg"),
                          const Text('ALBINO'),
                          const Text(
                              'WALEMAVU WA NGOZI PIA WANA HITAJI VITU VINGI VYA MUHIMU KAMA VILE DAMU,PESA,NGUO(KOFIA ZA KUJIKINGA NA '
                              'MIALE YA JUA,MIWANI HIVYO BASI MAHITAJI KAMA HAYO WANAHITAJI KUSAIDIWA HIVYO BASI KAMA UNACHO '
                              'CHOCHOTE KITU UNAWEZA KUSAIDIA WALEMAVU HAWA WA NGOZI'),
                          const Text(
                              'UNAWEZA KUWASILIANA NAO ILI KUWEZA KUWAFIKISHIA ULICHO'),
                          TextButton(
                              onPressed: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => Albino()));
                              },
                              child: const Text('CHANGIA SASA'))
                        ],
                      )),
                ])));
  }
}
