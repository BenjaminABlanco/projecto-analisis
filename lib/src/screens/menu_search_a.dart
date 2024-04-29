import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/constantes.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class SearchRenterScreen extends StatelessWidget {
  const SearchRenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Arrendatario'),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      drawer: CustomDrawer(isMainScreen: false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/vm_icon.png'),
              fit: BoxFit.fitHeight,
              width: 100,
              height: 100,
            ),
            const Text(
              'Buscar Arrendatarios',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 100, 
              height: 35,
              child: MyAppButton(
                text: 'Buscar',
                onPressed: () {
                  print('Search by Name button pressed');
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Número de Identidad',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 100, 
              height: 35,
              child: MyAppButton(
                text: 'Buscar',
                onPressed: () {
                  print('Search by Name button pressed');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyAppButton({super.key, 
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}