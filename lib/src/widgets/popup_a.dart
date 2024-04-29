import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/tooltip.dart';

class SearchRenterPopup extends StatefulWidget {
  String? ruta;
  @override
  _SearchRenterPopupState createState() => _SearchRenterPopupState();
  SearchRenterPopup({super.key, this.ruta = null});
}

class _SearchRenterPopupState extends State<SearchRenterPopup> {
  final _formKeyNombre = GlobalKey<FormState>();
  final _formKeyNumeroDeIdentidad = GlobalKey<FormState>();
  String? _nombre;
  String? _numeroDeIdentidad;
  bool _nombreError = false;
  bool _numeroDeIdentidadError = false;
  bool _nombreFilled = false;
  bool _numeroDeIdentidadFilled = false;

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
                'Buscar Arrendatarios',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKeyNombre,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nombre',
                          border: OutlineInputBorder(),
                          errorText: _nombreError? 'Ingrese un nombre' : null,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese un nombre';
                          }
                          return null;
                        },
                        onSaved: (value) => _nombre = value,
                        onChanged: (value) {
                          setState(() {
                            _nombreFilled = value.isNotEmpty;
                            _numeroDeIdentidadFilled = false;
                          });
                        },
                        enabled:!_numeroDeIdentidadFilled,
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 150,
                      height: 35,
                      child: CustomTooltip(
                        message: 'Se buscará entre los nombres de arrendatarios', 
                        child: ElevatedButton(
                          onPressed: _numeroDeIdentidadFilled? null : () {
                            if (_formKeyNombre.currentState!.validate()) {
                              _formKeyNombre.currentState!.save();
                              if (_nombre!= null && _nombre!.isNotEmpty) {
                              print('Search by Name button pressed');
                                widget.ruta != null ? Navigator.popAndPushNamed(context, widget.ruta!, arguments: _nombre) : null;
                              } else {
                                setState(() {
                                  _nombreError = true;
                                });
                              }
                            }
                          },
                          child: Text('Buscar nombre'),
                          style: _numeroDeIdentidadFilled? ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)) : ButtonStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKeyNumeroDeIdentidad,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Número de Identidad',
                          border: OutlineInputBorder(),
                          errorText: _numeroDeIdentidadError
                              ? _numeroDeIdentidad!.length!= 13
                                  ? 'El DNI de un arrendatario consiste de 13 dígitos'
                                  : 'Ingrese un número de identidad'
                              : null,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese un número de identidad';
                          } else if (value.length!= 13) {
                            return 'El DNI de un arrendatario consiste de 13 dígitos';
                          }
                          return null;
                        },
                        onSaved: (value) => _numeroDeIdentidad = value,
                        onChanged: (value) {
                          setState(() {
                            _numeroDeIdentidadFilled = value.isNotEmpty;
                            _nombreFilled = false;
                          });
                        },
                        enabled:!_nombreFilled,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(13),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 150,
                      height: 35,
                      child: CustomTooltip(
                        message: 'Se buscará el DNI exacto del arrendatario', 
                        child: ElevatedButton(
                          onPressed: _numeroDeIdentidadFilled || _nombreFilled == false? () {
                            if (_formKeyNumeroDeIdentidad.currentState!.validate()) {
                              _formKeyNumeroDeIdentidad.currentState!.save();
                              if (_numeroDeIdentidad!= null && _numeroDeIdentidad!.isNotEmpty) {
                                print('Search by ID button pressed');
                                widget.ruta != null ? Navigator.popAndPushNamed(context, widget.ruta!, arguments: _numeroDeIdentidad) : null;
                              } else {
                                setState(() {
                                  _numeroDeIdentidadError = true;
                                });
                              }
                            }
                          } : null,
                          child: Text('Buscar identidad'),
                          style: _numeroDeIdentidadFilled || _nombreFilled == false? null : ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}