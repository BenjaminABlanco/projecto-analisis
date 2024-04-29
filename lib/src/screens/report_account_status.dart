import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class AccountStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Viviendas Módicas', back: true),
      drawer: CustomDrawer(isMainScreen: false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Estado de Cuenta del Arrendatario',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/vm_icon.png',
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Número de Referencia:',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Fecha de Emision: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              AccountStatusDTScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
class AccountStatusDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SelectionArea(
            child: DataTable(
              columnSpacing: 10, // Espacio entre las columnas
              headingRowColor: MaterialStateColor.resolveWith(
                (states) => Theme.of(context).primaryColor,
              ),
              headingRowHeight: 40, // Set the desired height here
              headingTextStyle: TextStyle(color: Colors.white),
              columns: [
                DataColumn(label: Text('Identidad')),
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Código Vivienda')),
                DataColumn(label: Text('Pago Renta')),
                DataColumn(label: Text('Deuda Renta')),
                DataColumn(label: Text('Pago Energía Eléctrica')),
                DataColumn(label: Text('Deuda Energía Eléctrica')),
                DataColumn(label: Text('Pago Agua Potable')),
                DataColumn(label: Text('Deuda Agua Potable')),
                DataColumn(label: Text('Observaciones')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('115551')),
                  DataCell(Text('Juan Pérez')),
                  DataCell(Text('1234')),
                  DataCell(Text('\ 200')),
                  DataCell(Text('\ 50')),
                  DataCell(Text('\ 100')),
                  DataCell(Text('\ 20')),
                  DataCell(Text('\ 30')),
                  DataCell(Text('\ 10')),
                  DataCell(Text('\ ninguno')),
                ]),
              ],
            ),
          )
        ),
      ),
    );
  }
}