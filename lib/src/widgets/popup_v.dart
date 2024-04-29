import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchByHousingPopup extends StatefulWidget {
  String? ruta;
  @override
  _SearchByHousingPopupState createState() => _SearchByHousingPopupState();
  SearchByHousingPopup({super.key, this.ruta = null});

}

class _SearchByHousingPopupState extends State<SearchByHousingPopup> {
  String? _ubicacion;
  List<String> _codigoDeViviendaOptions = [];
  List<String> _allCodigoDeViviendaOptions = [];
  String? _codigoDeViviendaValue;
  bool _codigoDeViviendaError = false;
  

  @override
  void initState() {
    super.initState();
    _getAllCodigoDeViviendaOptions();
    _codigoDeViviendaValue = null;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          padding: EdgeInsets.only(
            top: 50,
            bottom: 16,
            left: 16,
            right: 16,
          ),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage('assets/vm_icon.png'),
                fit: BoxFit.fitHeight,
                width: 100,
                height: 100,
              ),
              Text(
                'Filtrar ubicación de la vivienda:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
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
                    _codigoDeViviendaValue = null;
                    _codigoDeViviendaError = false;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Buscar por código de vivienda:',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Código de vivienda',
                  border: OutlineInputBorder(),
                  errorText: _codigoDeViviendaError? 'Seleccione un código de vivienda' : null,
                ),
                value: _codigoDeViviendaValue,
                items: _codigoDeViviendaOptions.map((String code) {
                  return DropdownMenuItem<String>(
                    value: code,
                    child: Text(code),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _codigoDeViviendaValue = newValue;
                    _codigoDeViviendaError = false;
                  });
                },
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_codigoDeViviendaValue == null) {
                        setState(() {
                          _codigoDeViviendaError = true;
                        });
                      } else {
                        print('Buscar button pressed');
                        widget.ruta != null ? Navigator.popAndPushNamed(context, widget.ruta!, arguments: _codigoDeViviendaValue) : null;
                      }
                    },
                    child: Text('Buscar', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _getAllCodigoDeViviendaOptions() async {
    // Replace with actual database call
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
    _codigoDeViviendaValue = null;
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