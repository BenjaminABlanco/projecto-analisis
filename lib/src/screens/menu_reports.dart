import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/constantes.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/tooltip.dart';

class ReportsMenu extends StatelessWidget {
  const ReportsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Reportes', back: true),
      drawer:  CustomDrawer(isMainScreen: false),
      body: Stack(
          children: [
            Center(
              child: SizedBox(
                width: 300,
                height: 371,
                child: Opacity(
                  opacity: 0.5,
                  child: Image.asset(
                    'assets/vm_icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 600, 
                    height: 50, 
                    child: CustomTooltip(
                      message: 'Ver a todos los arrendatarios que actualmente viven en Viviendas Módicas',
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rutas.actualArre.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50), 
                          textStyle: const TextStyle(fontSize: 22), 
                        ),
                        child: const Text('Lista de Arrendatarios Actuales'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 600,
                    height: 50,
                    child: CustomTooltip(
                      message: 'Ver las personas que anteriormente fueron arrendatarios de Viviendas Módicas',
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rutas.historialArre.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                        child: const Text('Historial de Arrendatarios'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 600,
                    height: 50,
                    child: CustomTooltip(
                      message: 'Ver la cantidad total que debe un arrendatario',
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rutas.pagosPendienteArre.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                        child: const Text('Pagos Pendientes de Arrendatarios'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 600,
                    height: 50,
                    child: CustomTooltip(
                      message: 'Ver la información de pagos y moras mensuales de un Arrendatario',
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rutas.estadoCuenta.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                        child: const Text('Estado de Cuenta de un Arrendatario'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 600,
                    height: 50,
                    child: CustomTooltip(
                      message: 'Ver cuantas viviendas poseen un arrendatario de las disponibles',
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rutas.viviendasOcupadas.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                        child: const Text('Total de Viviendas Ocupadas'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 600,
                    height: 50,
                    child: CustomTooltip(
                      message: 'Ver las cuentas que se le deben abonar a los proveedores de servicios como Energía Electrica o Agua Potable',
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rutas.cuentasPagarServicios.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                        child: const Text('Total Cuentas por pagar a proveedor de un Servicio'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 600,
                    height: 50,
                    child: CustomTooltip(
                      message: 'Ver un reporte de daños ocasionados a una vivienda de los que un arrendatario es responsable',
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rutas.facturaDanoPropiedad.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                        child: const Text('Factura por daños ocasionados a la propiedad'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
      )
    );
  }
}