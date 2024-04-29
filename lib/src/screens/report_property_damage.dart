import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class PropertyDamageScreen extends StatelessWidget {
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
                  'Factura por Daños Ocasionados a la Propiedad',
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
                      'No. de Reporte:',
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: SelectionArea(
                      child: DataTable(
                        columnSpacing: 30,
                        headingRowColor: MaterialStateColor.resolveWith(
                          (states) => Theme.of(context).primaryColor,
                        ),
                        headingRowHeight: 40,
                        headingTextStyle: TextStyle(color: Colors.white),
                        columns: [
                          DataColumn(label: Text('Codigo Vivienda')),
                          DataColumn(label: Text('Identidad')),
                          DataColumn(label: Text('Nombre')),
                          DataColumn(label: Text('Total por Reparaciones')),
                          DataColumn(label: Text('Monto Final')),
                          DataColumn(label: Text('Descripciones')),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(Text('1')),
                            DataCell(Text('1234567890')),
                            DataCell(Text('Nombre1')),
                            DataCell(Text('1000')),
                            DataCell(Text('500')),
                            DataCell(Text('Descripción1')),
                          ]),
                          DataRow(cells: [
                            DataCell(Text('2')),
                            DataCell(Text('0987654321')),
                            DataCell(Text('Nombre2')),
                            DataCell(Text('2000')),
                            DataCell(Text('700')),
                            DataCell(Text('Descripción2')),
                          ]),
                        ],
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}