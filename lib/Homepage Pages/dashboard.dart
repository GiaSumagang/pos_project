import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Product {
  final int id;
  final String name;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });
}

class DashboardPage extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'Product 1',
      price: 10.99,
      image: 'assets/images/product1.png',
    ),
    Product(
      id: 2,
      name: 'Product 2',
      price: 15.99,
      image: 'assets/images/product2.png',
    ),
    // Add more sample products as needed
  ];

  Future<void> scanBarcode(BuildContext context) async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000', // COLOR_CODE
        'Cancel', // CANCEL_BUTTON_TEXT
        true, // isShowFlashIcon
        ScanMode.DEFAULT, // scanMode
      );

      // Handle the scanned barcode result
      if (barcodeScanRes != '-1') {
        // Barcode was successfully scanned
        print('Scanned barcode: $barcodeScanRes');

        // TODO: Implement further processing logic with the scanned barcode
      } else {
        // Barcode scanning was canceled by the user
        print('Barcode scanning was canceled');
      }
    } catch (e) {
      // Handle any potential errors
      print('Error scanning barcode: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POS Dashboard'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(product: products[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => scanBarcode(context),
        child: Icon(Icons.qr_code_scanner),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            product.image,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 8),
          Text(
            product.name,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            '\$${product.price.toStringAsFixed(2)}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: DashboardPage(),
  ));
}
