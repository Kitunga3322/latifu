import 'package:flutter/material.dart';

class changia extends StatefulWidget {
  const changia({super.key});

  @override
  changiaState createState() => changiaState();
}

class changiaState extends State<changia> {
  final _amountController = TextEditingController();
  String? _selectedGateway;

  final List<String> _paymentGateways = [
    'M-Pesa',
    'Halo-Pesa',
    'Airtel',
    'Mixx by Yas',
    'bank'
  ];

  void _submitDonation() {
    String amount = _amountController.text;
    if (amount.isEmpty || _selectedGateway == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Samahan ingiza kiasi na  chagua mtandao')),
      );
      return;
    }
    if (amount.isNotEmpty || _selectedGateway != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Shukrani kwa mchango wako')),
      );
      return;
    }

    // Implement actual donation logic here
    print('Donating $amount via $_selectedGateway');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CHANGIA SASA'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Kiasi Cha Mchango',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedGateway,
              hint: Text('chagua Mtandao wa malipo'),
              onChanged: (value) {
                setState(() {
                  _selectedGateway = value;
                });
              },
              items: _paymentGateways.map((gateway) {
                return DropdownMenuItem(
                  value: gateway,
                  child: Text(gateway),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitDonation,
              child: Text('Changia Sasa'),
            ),
          ],
        ),
      ),
    );
  }
}
