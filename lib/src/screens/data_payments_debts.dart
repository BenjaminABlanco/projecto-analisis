import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/tooltip.dart';

class PaymentAndMorosoInfoScreen extends StatefulWidget {
  @override
  _PaymentAndMorosoInfoScreenState createState() => _PaymentAndMorosoInfoScreenState();
}

class _PaymentAndMorosoInfoScreenState extends State<PaymentAndMorosoInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  TextEditingController _identidadController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _montoController = TextEditingController();
  TextEditingController _montoDeudaController = TextEditingController();
  TextEditingController _montoDeudaAguaController = TextEditingController();
  TextEditingController _fechaMorosidadController = TextEditingController();
  TextEditingController _fechaMontoPagoViviendaController = TextEditingController();

  bool _isPaymentViviendaSubmitted = false;

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010, 8),
      lastDate: DateTime(2050),
    );
    if (picked!= null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  void _clearFields() {
    _identidadController.clear();
    _nombreController.clear();
    _montoController.clear();
    _montoDeudaController.clear();
    _montoDeudaAguaController.clear();
    _fechaMorosidadController.clear();
    _fechaMontoPagoViviendaController.clear();
  }

  void _submitPaymentAndMorosoInfo() {
    // Verifica si ya se ha registrado un pago para el mes actual
    if (_isPaymentViviendaSubmitted) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Ya se ha registrado el pago de la vivienda para este mes.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Aquí puedes agregar la lógica para registrar el pago
      // y guardar la información sobre el moroso del arrendatario
      String identidad = _identidadController.text;
      String nombre = _nombreController.text;
      double montoPago = double.tryParse(_montoController.text)?? 0.0;
      double montoDeuda = double.tryParse(_montoDeudaController.text)?? 0.0;
      double montoDeudaAgua = double.tryParse(_montoDeudaAguaController.text)?? 0.0;
      String fechaMorosidad = _fechaMorosidadController.text;
      String fechaMontoPagoVivienda = _fechaMontoPagoViviendaController.text;
      // Lógica para registrar el pago y la información sobre el moroso

      // Marca el pago de la vivienda como registrado
      _isPaymentViviendaSubmitted = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Registro de Pago y Morosidad', back: true),
      drawer:  CustomDrawer(isMainScreen: false),
      body: Center(
        child: KeyboardListener(
          focusNode: _focusNode,
          onKeyEvent: (event) {
            if (event.logicalKey == LogicalKeyboardKey.enter) {
              // Handle enter key press
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 300.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa la identidad del arrendatario',
                      child: TextFormField(
                        controller: _identidadController,
                        decoration: const InputDecoration(
                          labelText: 'Identidad del Arrendatario',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'La identidad es un campo necesario';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(13),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa el nombre del arrendatario',
                      child: TextFormField(
                        controller: _nombreController,
                        decoration: const InputDecoration(
                          labelText: 'Nombre del Arrendatario',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa el nombre del arrendatario';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa el monto del pago',
                      child: TextFormField(
                        controller: _montoController,
                        decoration: const InputDecoration(
                          labelText: 'Monto del Pago',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa el monto del pago';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'El monto del pago solo debe contener números';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa el monto de la deuda de electricidad',
                      child: TextFormField(
                        controller: _montoDeudaController,
                        decoration: const InputDecoration(
                          labelText: 'Monto de Deuda de Electricidad',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa el monto de la deuda de electricidad';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'El monto de la deuda de electricidad solo debe contener números';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomTooltip(
                      message: 'Ingresa el monto de la deuda de agua',
                      child: TextFormField(
                        controller: _montoDeudaAguaController,
                        decoration: const InputDecoration(
                          labelText: 'Monto de Deuda de Agua',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa el monto de la deuda de agua';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'El monto de la deuda de agua solo debe contener números';
                          }
                          return null;
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _selectDate(context, _fechaMorosidadController),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: CustomTooltip(
                          message: "Click para seleccionar una fecha",
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: _fechaMorosidadController,
                              decoration: const InputDecoration(
                                labelText: 'Fecha de Morosidad',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _selectDate(context, _fechaMontoPagoViviendaController),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: CustomTooltip(
                          message: "Click para seleccionar una fecha",
                          child: AbsorbPointer(
                            child: TextFormField(
                              controller: _fechaMontoPagoViviendaController,
                              decoration: const InputDecoration(
                                labelText: 'Fecha del Monto del Pago de la Vivienda',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            _clearFields();
                          },
                          child: Text('Cancelar'),
                          style: TextButton.styleFrom(
                            minimumSize: Size(200, 50),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                        SizedBox(
                          width:200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _submitPaymentAndMorosoInfo();
                              }
                            },
                            child: const Text('Guardar Información'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentAndMorosoInfoScreen(),
  ));
}