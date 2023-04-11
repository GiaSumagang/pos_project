import 'package:flutter/material.dart';

void main() {
  runApp(DashboardPage());
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: ListView(
          children: [
            Card(
              child: Column(
                children: [
                  Image.network('https://example.com/product-image.jpg'),
                  Text('Product Name'),
                  Text('\$10.00'),
                ],
              ),
            ),
            Card(
              child: Column(
                children: [
                  Image.network('https://example.com/product-image.jpg'),
                  Text('Product Name'),
                  Text('\$10.00'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
