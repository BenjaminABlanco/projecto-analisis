import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/tooltip.dart';

class RemoveTenantScreen extends StatefulWidget {
  @override
  _RemoveTenantScreenState createState() => _RemoveTenantScreenState();
}

class _RemoveTenantScreenState extends State<RemoveTenantScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _idController = TextEditingController();
  String _tenantName = '';
  String _tenantLocation = '';
  bool _isBuscarPressed = false;

  void _findTenant() {
    // Aquí puedes agregar la lógica para buscar al arrendatario
    // utilizando el ID proporcionado en el campo de texto
    int id = int.tryParse(_idController.text)?? 0;
    // Lógica para buscar al arrendatario con el ID proporcionado
    // y actualizar _tenantName y _tenantLocation si se encuentra
    setState(() {
      _isBuscarPressed = true;
    });
  }

  void _removeTenant() {
    // Aquí puedes agregar la lógica para eliminar al arrendatario
    // utilizando el ID proporcionado en el campo de texto
    int id = int.tryParse(_idController.text)?? 0;
    // Lógica para eliminar al arrendatario con el ID proporcionado
  }

  void _cancel() {
    setState(() {
      _idController.clear();
      _isBuscarPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Eliminar Arrendatario', back: true),
      drawer:  CustomDrawer(isMainScreen: false),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 300.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                CustomTooltip(
                  message: 'Ingresa el ID del Arrendatario',
                  child: TextFormField(
                    controller: _idController,
                    decoration: const InputDecoration(
                      labelText: 'ID del Arrendatario',
                      border: OutlineInputBorder(),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(13),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El ID del Arrendatario es un campo necesario';
                      }
                      if (value.length!= 13) {
                        return 'El DNI debe tener 13 dígitos';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      if (_formKey.currentState?.validate()?? false) {
                        _findTenant();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                if (_isBuscarPressed)
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text('Nombre: $_tenantName'),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding:EdgeInsets.all(10),
                        child: Text('Ubicación: $_tenantLocation'),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: _cancel,
                            child: Text('Cancelar'),
                            style: TextButton.styleFrom(
                              minimumSize: Size(150, 50),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate()??
                                  false) {
                                _findTenant();
                              }
                            },
                            child: Text('Buscar'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(150, 50),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                else
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate()??
                          false) {
                        _findTenant();
                      }
                    },
                    child: Text('Buscar'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}