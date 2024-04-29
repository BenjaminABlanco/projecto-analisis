import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:viviendas_modicas_sistema/data/local/db/app_db.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class RentersCurrentcreen extends StatelessWidget {
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
              RentersCurrentDTScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
//| Identidad |  Nombre | Código de Vivienda | Fecha de Entrada | Precio Renta | Observaciones
class RentersCurrentDTScreen extends StatefulWidget {
  const RentersCurrentDTScreen({Key? key}):super(key: key);
  @override
  State<RentersCurrentDTScreen> createState()=> _RentersCurrentDTScreen();
}
class _RentersCurrentDTScreen extends State<RentersCurrentDTScreen>{
  late AppDb _db;

  @override
  void initState(){
    super.initState();
    _db = AppDb();
  }
  @override
  void dispose(){
    _db.close();
    super.dispose();
  }
  @override
Widget build(BuildContext context) {
  return FutureBuilder<List<Arrendatario>>(
    future: _db.getArrendatarios(),
    builder: (context, snapshot) {
      final List<Arrendatario>? arrendatarios = snapshot.data;

      if (snapshot.connectionState != ConnectionState.done) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (snapshot.hasError) {
        return Center(
          child: Text(snapshot.error.toString()),
        );
      }

      if (arrendatarios != null) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
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
                  DataColumn(label: Text('Identidad')),
                  DataColumn(label: Text('Nombre')),
                  // DataColumn(label: Text('Codigo Vivienda')),
                  // DataColumn(label: Text('Fecha de Entrada')),
                  // DataColumn(label: Text('Precio Renta')),
                  // DataColumn(label: Text('Observaciones')),
                ],
                rows: arrendatarios.map((arrendatario) => DataRow(
                  cells: [
                    DataCell(Text(arrendatario.identidad.toString())),
                    DataCell(Text(arrendatario.nombre.toString())),
                    // DataCell(Text(arrendatario.codigoVivienda.toString())),
                    // DataCell(Text(arrendatario.fechaEntrada.toString())),
                    // DataCell(Text(arrendatario.precioRenta.toString())),
                    // DataCell(Text(arrendatario.observaciones.toString())),
                  ],
                )).toList(),
              ),
            ),
          ),
        );
      }

      return const Text('No data found');
    },
  );
}
}
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         child: SelectionArea(
//           child: DataTable(
//             columnSpacing: 30,
//             headingRowColor: MaterialStateColor.resolveWith(
//               (states) => Theme.of(context).primaryColor,
//             ),
//             headingRowHeight: 40,
//             headingTextStyle: TextStyle(color: Colors.white),
//             columns: [
//               DataColumn(label: Text('Identidad')),
//               DataColumn(label: Text('Nombre')),
//               DataColumn(label: Text('Codigo Vivienda')),
//               DataColumn(label: Text('Fecha de Entrada')),
//               DataColumn(label: Text('Precio Renta')),
//               DataColumn(label: Text('Observaciones')),
//             ],
//             // rows: [
//               // DataRow(cells: [
//               //   DataCell(Text('1234567890')),
//               //   DataCell(Text('Nombre1')),
//               //   DataCell(Text('1')),
//               //   DataCell(Text('12/03/2021')),
//               //   DataCell(Text('2500')),
//               //   DataCell(Text('Observación1')),
//               // ]),
//               // DataRow(cells: [
//               //   DataCell(Text('0987654321')),
//               //   DataCell(Text('Nombre2')),
//               //   DataCell(Text('2')),
//               //   DataCell(Text('03/12/2019')),
//               //   DataCell(Text('1700')),
//               //   DataCell(Text('Observación2')),
//               // ]),
//               // //...
//             // ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// FutureBuilder<List<Arrendatario>>()
//   future: _db.getArrendatarios(),
//   builder:(context,snapshot){
//     final List<Arrendatario>? arrendatarios = snapshot.data;
//     if(snapshot.connectionState != ConnectionState.done){
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }
//     if(snapshot.hasError){
//       return Center(
//         child:Text(snapshot.error.toString()),
//       );
//     }
//     if(Arrendatarios != null){
//       return ListView.Builder(
//         itemCount:Arrendatarios.length,
//         itemBuilder: (context,index){
//         final arrendatario = arrendatarios[index];
//         return Card(
//           child:Column(
//             children:[
//               Text(Arrendatario.nombre.toString()),
//               Text(Arrendatario.identidad.toString())
//             ],
//           ),
//         );
//       });
//     }
//     return const Text('No data found');
//   }