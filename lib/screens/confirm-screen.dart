import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../rest/models/products-model.dart';
import '../rest/models/user-model.dart';

class ConfirmScreen extends StatefulWidget {
  ConfirmScreen(UserModel receiver, List<ProductsModel> products, {super.key}){
    _receiver = receiver;
    _products = products;
  }

  static UserModel? _receiver;
  static List<ProductsModel>? _products;
  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ongoing Request'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Delivery Address',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.pin_drop),
                        SizedBox(width: 8),
                        Text(ConfirmScreen._receiver!.address.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ExpandableSection(
              title: 'Articles collected',
              child: Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text('1. ${ConfirmScreen._products?.first.name} '),
                    Text('for ${ConfirmScreen._products?.first.price}€')
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.white12,
              child: Column(
                children: [
                  Text(
                    'Scan the Code to pay',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  QrCodeWidget(
                    data: 'Payment QR Code',
                    size: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.red[400],
        currentIndex: 2,
        onTap: (int newindex) {
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: 'Discounts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}

class ExpandableSection extends StatefulWidget {
  final String title;
  final Widget child;

  ExpandableSection({
    required this.title,
    required this.child,
  });

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                  ),
                  SizedBox(width: 8),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded) widget.child,
        ],
      ),
    );
  }
}

class QrCodeWidget extends StatelessWidget {
  final String data;
  final double size;

  QrCodeWidget({
    required this.data,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      color: Colors.white,
      child: Center(
        child: Text(
          'QR Code Placeholder',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
