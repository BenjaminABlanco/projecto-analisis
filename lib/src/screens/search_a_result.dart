// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:intl/intl.dart';
// import '../widgets/appbar.dart';
// import '../widgets/drawer.dart';

// class RentersSearchResultScreen extends StatelessWidget {
//   final String _searchValue;
//   // final bool _isNombreSearch;

//   RentersSearchResultScreen({required String searchValue, /*required bool isNombreSearch*/})
//       : _searchValue = searchValue;
//         // _isNombreSearch = isNombreSearch;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Viviendas Módicas', back: true),
//       drawer: CustomDrawer(isMainScreen: false),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 16),
//               Center(
//                 child: Text(
//                   'Resultado de Búsqueda',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: Image.asset(
//                     'assets/vm_icon.png',
//                     height: 100,
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     'Fecha de Búsqueda: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
//                     textAlign: TextAlign.end,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               RentersSearchResultDTScreen(searchValue: _searchValue/*, isNombreSearch: _isNombreSearch*/),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class RentersSearchResultDTScreen extends StatelessWidget {
//   final String _searchValue;
//   // final bool _isNombreSearch;

//   RentersSearchResultDTScreen({required String searchValue/*, required bool isNombreSearch*/})
//       : _searchValue = searchValue/*,
//         _isNombreSearch = isNombreSearch*/;

//   @override
//   Widget build(BuildContext context) {
//     // Here, you can perform the database operation based on the search value and type
//     // For example:
//     List<DataRow> rows = [];
//     // if (_isNombreSearch) {
//     //   // Search for arrendatarios with similar name
//     //   // rows = database.searchByName(_searchValue).map((arrendatario) => DataRow(cells: [
//     //   //   DataCell(Text(arrendatario.identidad)),
//     //   //   DataCell(Text(arrendatario.nombre)),
//     //   //   DataCell(Text(arrendatario.codigoVivienda)),
//     //   //   DataCell(Text(DateFormat('dd/MM/yyyy').format(arrendatario.fechaEntrada))),
//     //   //   DataCell(Text(arrendatario.precioRenta.toString())),
//     //   //   DataCell(Text(arrendatario.observaciones)),
//     //   // ])).toList();
//     // } else {
//     //   // Search for arrendatario with exact ID
//     //   // rows = database.searchById(_searchValue).map((arrendatario) => DataRow(cells: [
//     //   //   DataCell(Text(arrendatario.identidad)),
//     //   //   DataCell(Text(arrendatario.nombre)),
//     //   //   DataCell(Text(arrendatario.codigoVivienda)),
//     //   //   DataCell(Text(DateFormat('dd/MM/yyyy').format(arrendatario.fechaEntrada))),
//     //   //   DataCell(Text(arrendatario.precioRenta.toString())),
//     //   //   DataCell(Text(arrendatario.observaciones)),
//     //   // ])).toList();
//     // }

//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: DataTable(
//           columnSpacing: 20,
//           columns: [
//             DataColumn(label: Text('Identidad')),
//             DataColumn(label: Text('Nombre')),
//             DataColumn(label: Text('Código Vivienda')),
//             DataColumn(label: Text('Fecha Entrada')),
//             DataColumn(label: Text('Precio Renta')),
//             DataColumn(label: Text('Observaciones')),
//           ],
//           rows: rows,
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class RentersSearchResultScreen extends StatelessWidget {
  final String selectedValue;

  RentersSearchResultScreen({required this.selectedValue});

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