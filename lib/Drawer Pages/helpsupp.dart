import 'package:flutter/material.dart';

class HelpSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Text('Help & Support'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'How can we help you today?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to Contact Support page
              },
              child: const Text('Contact Support'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Or choose a topic to get started:',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('Account'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Account Help page
              },
            ),
            ListTile(
              title: Text('Payment'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to Payment Help page
              },
            ),
            ListTile(
              title: Text('FAQ'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to FAQ page
              },
            ),
          ],
        ),
      ),
    );
  }
}