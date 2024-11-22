import 'package:flutter/material.dart';
import 'billing_page.dart';

void main() {
  runApp(WarnetApp());
}

class WarnetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warnet Billing',
      home: BillingPage(),
    );
  }
}
