import 'package:flutter/material.dart';

class DisplaySelectedValueScreen extends StatelessWidget {
  final String selectedValue;

  DisplaySelectedValueScreen({required this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Value'),
      ),
      body: Center(
        child: Text(
          'Código Elegido: $selectedValue',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}