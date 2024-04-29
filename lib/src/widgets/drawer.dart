import 'package:flutter/material.dart';
import '../shared/constantes.dart';

class CustomDrawer extends StatelessWidget {
  final bool isMainScreen;

  CustomDrawer({this.isMainScreen = false});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: isMainScreen
                ? null
                  : () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Rutas.menuPrincipal.name);
                    },
              child: Tooltip(
                message: 'Navegar al Menú Principal',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 150,
                    height: 185, 
                    child: Image.asset(
                      'assets/vm_icon.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                
                Navigator.pushNamed(context, Rutas.inicioSesion.name);
              },
              child: const Text('Cerrar Sesión', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(88, 54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
