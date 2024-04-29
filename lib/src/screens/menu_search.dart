import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/constantes.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';
import '../widgets/tooltip.dart';
import '../widgets/popup_a.dart';
import '../widgets/popup_v.dart';

class SearchDataMenu extends StatelessWidget {
  const SearchDataMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Buscar datos', back: true),
      drawer: CustomDrawer(isMainScreen: false),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              CustomTooltip(
                message: 'Buscar la información individual de un Arrendatario',
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 70),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SearchRenterPopup(ruta: Rutas.buscarTestResult.name,);
                      },
                    );
                  },
                  child: const Text('Buscar Arrendatario',style: TextStyle(fontSize: 24,)),
                ),
              ),
              const SizedBox(height: 20),
              CustomTooltip(
                message: 'Buscar entradas del sistema de acuerdo a la Vivienda',
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(400, 70),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SearchByHousingPopup(ruta: Rutas.buscarVResult.name,);
                      },
                    );
                  },
                  child: const Text('Buscar por Vivienda',style: TextStyle(fontSize: 24,)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}