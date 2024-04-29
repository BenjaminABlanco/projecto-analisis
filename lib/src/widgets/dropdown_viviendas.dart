import 'package:flutter/material.dart';

class CustomDropDownViviendas extends StatefulWidget {
  const CustomDropDownViviendas({super.key});

  @override
  _CustomDropDownViviendasState createState() => _CustomDropDownViviendasState();
}

class _CustomDropDownViviendasState extends State<CustomDropDownViviendas> {
  String? _ubicacion;
  List<String> _codigoDeViviendaOptions = [];
  List<String> _allCodigoDeViviendaOptions = [];

  @override
  void initState() {
    super.initState();
    _getAllCodigoDeViviendaOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Filtrar ubicación de la vivienda:',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Ubicación',
            border: OutlineInputBorder(),
          ),
          value: _ubicacion,
          items: [
            'La Laguna [LLG]',
            'El Porvenir [EPV]',
            'La 23 de Abril [23A]',
            'Mostrar Todas'
          ].map((String location) {
            return DropdownMenuItem<String>(
              value: location,
              child: Text(location),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _ubicacion = newValue;
              _filterCodigoDeViviendaOptions();
            });
          },
        ),
        const SizedBox(height: 20),
        const Text(
          'Buscar por código de vivienda:',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Código de vivienda',
            border: OutlineInputBorder(),
          ),
          value: null,
          items: _codigoDeViviendaOptions.map((String code) {
            return DropdownMenuItem<String>(
              value: code,
              child: Text(code),
            );
          }).toList(),
          onChanged: (String? newValue) {},
        ),
      ],
    );
  }

  void _getAllCodigoDeViviendaOptions() async {
    List<String> codes = await DatabaseService.getCodigoDeViviendaOptions();
    setState(() {
      _allCodigoDeViviendaOptions = codes;
      _codigoDeViviendaOptions = codes;
    });
  }

  void _filterCodigoDeViviendaOptions() {
    if (_ubicacion == 'Mostrar Todas') {
      setState(() {
        _codigoDeViviendaOptions = _allCodigoDeViviendaOptions;
      });
    } else {
      String prefix = _ubicacion!.substring(_ubicacion!.indexOf('[') + 1, _ubicacion!.indexOf(']'));
      setState(() {
        _codigoDeViviendaOptions = _allCodigoDeViviendaOptions.where((code) => code.startsWith(prefix)).toList();
      });
    }
  }
}

class DatabaseService {
  static Future<List<String>> getCodigoDeViviendaOptions() async {
    // Replace with actual database call
    return [
      "LLG-A01",
      "LLG-A02",
      "LLG-A03",
      "EPV-A01",
      "EPV-A02",
      "EPV-C01",
      "23A-C01",
    ];
  }
}