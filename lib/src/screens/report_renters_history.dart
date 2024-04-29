import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class RentersHistorycreen extends StatelessWidget {
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
                  'Reporte de Historial de Arrendatarios',
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Fecha de Emision: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
                    textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              RentersHistoryDTScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class RentersHistoryDTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SelectionArea(
          child: DataTable(
            columnSpacing: 10, // Espacio entre columnas
            headingRowColor: MaterialStateColor.resolveWith(
              (states) => Theme.of(context).primaryColor,
            ),
            headingRowHeight: 40,
            headingTextStyle: TextStyle(color: Colors.white),
            columns: [
              DataColumn(label: Text('Identidad')),
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Fecha Entrada')),
              DataColumn(label: Text('Fecha Salida')),
              DataColumn(label: Text('Precio Renta')),
              DataColumn(label: Text('Deuda Pendiente')),
              DataColumn(label: Text('Daños Propiedad')),
              DataColumn(label: Text('Observaciones')),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Juan Pérez')),
                DataCell(Text('01/04/2024')),
                DataCell(Text('15/04/2024')),
                DataCell(Text('\5000 lps')),
                DataCell(Text('\500 lps')),
                DataCell(Text('0')),
                DataCell(Text('Ninguna')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('María López')),
                DataCell(Text('03/04/2024')),
                DataCell(Text('20/04/2024')),
                DataCell(Text('\6000 lps')),
                DataCell(Text('\0 lps')),
                DataCell(Text('1000')),
                DataCell(Text('Pequeños arreglos necesarios')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
// class RentersHistoryDTScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Historial de arrendatarios Previos', back: true),
//       drawer:  CustomDrawer(isMainScreen: false),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           child: DataTable(
//             columnSpacing: 10, // Espacio entre columnas
//             dataRowHeight: 56, // Altura de las filas
//             columns: [
//               DataColumn(label: Text('Identidad')),
//               DataColumn(label: Text('Nombre')),
//               DataColumn(label: Text('Fecha Entrada')),
//               DataColumn(label: Text('Fecha Salida')),
//               DataColumn(label: Text('Precio Renta')),
//               DataColumn(label: Text('Deuda Pendiente')),
//               DataColumn(label: Text('Daños Propiedad')),
//               DataColumn(label: Text('Observaciones')),
//             ],
//             rows: [
//               DataRow(cells: [
//                 DataCell(Text('1')),
//                 DataCell(Text('Juan Pérez')),
//                 DataCell(Text('01/04/2024')),
//                 DataCell(Text('15/04/2024')),
//                 DataCell(Text('\5000 lps')),
//                 DataCell(Text('\500 lps')),
//                 DataCell(Text('0')),
//                 DataCell(Text('Ninguna')),
//               ]),
//               DataRow(cells: [
//                 DataCell(Text('2')),
//                 DataCell(Text('María López')),
//                 DataCell(Text('03/04/2024')),
//                 DataCell(Text('20/04/2024')),
//                 DataCell(Text('\6000 lps')),
//                 DataCell(Text('\0 lps')),
//                 DataCell(Text('1000')),
//                 DataCell(Text('Pequeños arreglos necesarios')),
//               ]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
