import 'package:flutter/material.dart';

class dharula extends StatefulWidget {
  const dharula({super.key});

  @override
  _dharuraState createState() => _dharuraState();
}

class _dharuraState extends State<dharula> {
  // Dummy list of reports - replace with your actual data fetching logic
  final List<Report> _reports = [
    Report(
      id: '1',
      Image: ("images/2.jpg"),
      title: 'Major Road Accident on Nyerere Road',
      description:
          'AJALI MBAYA IMETOKEA MAENEO YA KINONDONI WATU 30 WANAHITAJI KUONGEZEWA DAMU TUNAKUOMBA MSAADA WAKO ILI KUOKOA UHAI WA WATU HAWA WAGOMJWA WAPO HOSPITALI YA MUHIMBILI PIA UNAWEZA KUWASILISHA MCHANGO WA WAGOMJWA HAO KWA KWA NAMBA +2556211213348',
      location: 'Nyerere Road, karibu na Tazara Flyover',
      Uhitaji: 'MKUBWA',
      reportedAt: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Report(
      id: '2',
      Image: ('images/2.jpg'),
      title: 'Power Outage in Kinondoni Area',
      description:
          'Widespread power outage affecting residential and commercial areas. Reported by Admin B at 9:30 AM.',
      location: 'Kinondoni Municipality',
      Uhitaji: 'Medium',
      reportedAt: DateTime.now().subtract(Duration(hours: 3)),
    ),
    Report(
      id: '3',
      Image: ("images/2.jpg"),
      title: 'Flash Floods in Msimbazi Valley',
      description:
          'Heavy rainfall causing flooding in low-lying areas. Reported by Admin C at 8:00 AM.',
      location: 'Msimbazi River Valley',
      Uhitaji: 'High',
      reportedAt: DateTime.now().subtract(Duration(hours: 4)),
    ),
    // Add more reports here as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MATUKIO YA DHARURA'),
        centerTitle: true,
      ),
      body: _reports.isEmpty
          ? Center(
              child: Text('No emergency reports available at this time.'),
            )
          : ListView.builder(
              itemCount: _reports.length,
              itemBuilder: (context, index) {
                final report = _reports[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          report.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(report.description),
                        SizedBox(height: 8.0),
                        Row(
                          children: <Widget>[
                            Icon(Icons.location_on, color: Colors.grey),
                            SizedBox(width: 4.0),
                            Text('Location: ${report.location}'),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Text('Uhitaji: ${report.Uhitaji}',
                            style: TextStyle(fontWeight: FontWeight.w500)),
                        SizedBox(height: 4.0),
                        Text(
                          'Reported at: ${report.reportedAt.toLocal().toString().split('.').first}',
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 12.0),
                        ),
                        // You can add more details here if needed
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// Define a simple data model for a Report
class Report {
  final String id;
  final String Image;
  final String title;
  final String description;
  final String location;
  final String Uhitaji;
  final DateTime reportedAt;

  Report({
    required this.id,
    required this.Image,
    required this.title,
    required this.description,
    required this.location,
    required this.Uhitaji,
    required this.reportedAt,
  });
}
