import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/constantes.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/tooltip.dart';

class AdminDataScreen extends StatelessWidget {
  const AdminDataScreen.AdminDataMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Administrar Datos', back: true),
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
                      message: 'Introducir los datos de alguien que ha comenzado a arrendar en Viviendas Módicas',
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rutas.anadirArre.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50), 
                          textStyle: const TextStyle(fontSize: 22), 
                        ),
                        child: const Text('Añadir Arrendatario al sistema'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 600,
                    height: 50,
                    child: CustomTooltip(
                      message: 'Indicar que un individuo ha dejado de arrendar su vivienda, y que se le añada al Historial',
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rutas.removerArre.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                        child: const Text('Remover Arrendatario del sistema'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 600,
                    height: 50,
                    child: CustomTooltip(
                      message: 'Actualizar la informaciuón respecto a los pagos y deudas de arrendatarios',
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rutas.introducirPagosMoras.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                        child: const Text('Introducir información de Pago/Mora'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 600,
                    height: 50,
                    child: CustomTooltip(
                      message: 'Cmabiar la información de pago de servicios en viviendas desocupadas',
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Rutas.editarPagosDesocupadas.name);
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(500, 50),
                          textStyle: const TextStyle(fontSize: 22),
                        ),
                        child: const Text('Editar Pagos por Conexiones de Viviendas Desocupadas'),
                      ),
                      )
                  ),
                  
                ],
              ),
            )
          ],
      )
    );
  }
}
