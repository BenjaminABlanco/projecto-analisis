import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class AccounstToPayServicesScreen extends StatelessWidget {
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
                  'Total de Cuentas por pagar a proveedores de un Servicio',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Periodo del 17/02/2024 al 17/03/2024',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      'No. Reporte:',
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
              Expanded(
                child: AccounstToPayServicesDTScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class AccounstToPayServicesDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Proveedores de Servicios',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SelectionArea(
                    child: DataTable(
                      columnSpacing: 10, 
                      headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).primaryColor,
                      ),
                      headingRowHeight: 40, 
                      headingTextStyle: TextStyle(color: Colors.white),
                      columns: [
                        DataColumn(label: Text('Proveedor')),
                        DataColumn(label: Text('Servicio')),
                        DataColumn(label: Text('Monto Total')),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text('Proveedor 1')),
                          DataCell(Text('Servicio A')),
                          DataCell(Text('\$100.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Proveedor 2')),
                          DataCell(Text('Servicio B')),
                          DataCell(Text('\$200.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Proveedor 3')),
                          DataCell(Text('Servicio C')),
                          DataCell(Text('\$300.00')),
                        ]),
                      ],
                    ),
                  )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}