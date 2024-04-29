// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../src/models/colors.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Iniciar Viviendas Módicas',
//       theme: ThemeData(
//         useMaterial3: false,
//         primarySwatch: CustomColor.cVerde,
//       ),
//       home: const LoginScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class MyAppButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;

//   const MyAppButton({super.key, 
//     required this.text,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       child: Text(text),
//     );
//   }
// }

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final bool back;

//   @override
//   final Size preferredSize;

//   CustomAppBar({required this.title, this.back = false})
//       : preferredSize = Size.fromHeight(kToolbarHeight);

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       title: Text(title),
//       leading: Builder(
//         builder: (BuildContext context) {
//           return Tooltip(
//             message: 'Abrir Menú Lateral', // Custom tooltip message
//             child: IconButton(
//               icon: Icon(Icons.menu),
//               onPressed: () {
//                 Scaffold.of(context).openDrawer();
//               },
//             ),
//           );
//         },
//       ),
//       actions: back
//           ? [
//               IconButton(
//                 icon: Icon(Icons.arrow_back),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ]
//           : null,
//     );
//   }
// }

// class CustomDrawer extends StatelessWidget {
//   final bool isMainScreen;

//   CustomDrawer({this.isMainScreen = false});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           MouseRegion(
//             cursor: SystemMouseCursors.click,
//             child: GestureDetector(
//               onTap: isMainScreen
//                   ? null
//                   : () {
//                       Navigator.pop(context);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const MainMenu()
//                         ),
//                       );
//                     },
//               child: Tooltip(
//                 message: 'Navegar al Menú Principal',
//                 child: SizedBox(
//                   width: 150,
//                   height: 185, 
//                   child: Image.asset(
//                     'assets/vm_icon.png',
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
//             child: ElevatedButton(
//               onPressed: () {
                
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const LoginScreen()),
//                 );
//               },
//               child: const Text('Cerrar Sesión', style: TextStyle(fontSize: 18)),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(88, 54),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class _LoginScreenState extends State<LoginScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final FocusNode _focusNode = FocusNode();
//   String? _username, _password;
//   bool _loginError = false;

//   void _handleLogin() {
//     if (_formKey.currentState != null && _formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       if (_username == 'Admin' && _password == '123456789') {
//         print('Login Successful!');
//         setState(() {
//           _loginError = false;
//         });
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const MainMenu()),
//         );
//       } else {
//         print('Invalid username or password');
//         setState(() {
//           _loginError = true;
//         });
//       }
//     }
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: RawKeyboardListener(
//           focusNode: _focusNode,
//           onKey: (event) {
//             if (event is RawKeyDownEvent &&
//                 event.logicalKey == LogicalKeyboardKey.enter) {
//               _handleLogin();
//             }
//           },
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 300.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(
//                       width: double.infinity,
//                       height: 300,
//                       child: Image(
//                         image: AssetImage('assets/vm_icon.png'),
//                         fit: BoxFit.fitHeight,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     const Text(
//                       'Inicio de Sesión',
//                       style:
//                           TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         labelText: 'Usuario',
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Ingresa tu nombre de Usuario';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) => _username = value,
//                     ),
//                     const SizedBox(height: 20),
//                     TextFormField(
//                       decoration: const InputDecoration(
//                         labelText: 'Contraseña',
//                         border: OutlineInputBorder(),
//                       ),
//                       obscureText: true,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Ingresa tu Contraseña';
//                         }
//                         return null;
//                       },
//                       onSaved: (value) => _password = value,
//                     ),
//                     const SizedBox(height: 20),
//                     SizedBox(
//                       width: 150,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: _handleLogin,
//                         child: const Text('Entrar'),
//                       ),
//                     ),
//                     if (_loginError)
//                       const Text(
//                         'Usuario o contraseña incorrectos',
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }
// }


// class MainMenu extends StatelessWidget {
//   const MainMenu({super.key});

//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: CustomAppBar(title: 'Menú Principal', back: false),
//     drawer:  CustomDrawer(isMainScreen: true),
//     body: Stack(
//       children: [
//         Center(
//           child: SizedBox(
//             width: 300,
//             height: 371,
//             child: Opacity(
//               opacity: 0.5,
//               child: Image.asset(
//                 'assets/vm_icon.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 100),
//                 Tooltip(
//                   message: 'Añadir or Remover cierta información del sistema',
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(400, 70),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const AdminData()),
//                       );
//                     },
//                     child: const Text('Administrar Datos',style: TextStyle(fontSize: 22,)),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Tooltip(
//                   message: 'Acceder a las salidas de información del sistema',
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(400, 70),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const ReportsScreen()),
//                       );
//                     },
//                     child: const Text('Reportes',style: TextStyle(fontSize: 24,)),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Tooltip(
//                   message: 'Buscar la información individual de un Arrendatario',
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(400, 70),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const SearchRenterScreen()),
//                       );
//                     },
//                     child: const Text('Buscar Arrendatario',style: TextStyle(fontSize: 24,)),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Tooltip(
//                   message: 'Buscar entradas del sistema de acuerdo a la Vivienda',
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: const Size(400, 70),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const SearchByHousingScreen()),
//                       );
//                     },
//                     child: const Text('Buscar por Vivienda',style: TextStyle(fontSize: 24,)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

// }

// class CurrentRentersScreen extends StatelessWidget {
//   const CurrentRentersScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Reportes', back: false),
//       drawer:  CustomDrawer(isMainScreen: false),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 500, 
//               height: 50, 
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const CurrentTenantsListScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(200, 50), 
//                   textStyle: const TextStyle(fontSize: 22), 
//                 ),
//                 child: const Text('Lista de Arrendatarios Actuales'),
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: 500,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const PreviousTenantsHistoryScreen()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(500, 50),
//                   textStyle: const TextStyle(fontSize: 22),
//                 ),
//                 child: const Text('Historial de Arrendatarios Previos'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// }

// class AdminData extends StatelessWidget {
//   const AdminData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Administrar Datos', back: true),
//       drawer:  CustomDrawer(isMainScreen: false),
//       body: Stack(
//           children: [
//             Center(
//               child: SizedBox(
//                 width: 300,
//                 height: 371,
//                 child: Opacity(
//                   opacity: 0.5,
//                   child: Image.asset(
//                     'assets/vm_icon.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 600, 
//                     height: 50, 
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const CurrentTenantsListScreen()
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(200, 50), 
//                         textStyle: const TextStyle(fontSize: 22), 
//                       ),
//                       child: const Text('Añadir Arrendatario al sistema'),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 600,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PreviousTenantsHistoryScreen()
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(500, 50),
//                         textStyle: const TextStyle(fontSize: 22),
//                       ),
//                       child: const Text('Remover Arrendatario del sistema'),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 600,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PreviousTenantsHistoryScreen()
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(500, 50),
//                         textStyle: const TextStyle(fontSize: 22),
//                       ),
//                       child: const Text('Introducir información de Pago'),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 600,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PreviousTenantsHistoryScreen()
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(500, 50),
//                         textStyle: const TextStyle(fontSize: 22),
//                       ),
//                       child: const Text('Introducir información de Mora'),
//                     ),
//                   ),
                  
//                 ],
//               ),
//             )
//           ],
//       )
//     );
//   }
// }
// class ReportsScreen extends StatelessWidget {
//   const ReportsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Reportes', back: true),
//       drawer:  CustomDrawer(isMainScreen: false),
//       body: Stack(
//           children: [
//             Center(
//               child: SizedBox(
//                 width: 300,
//                 height: 371,
//                 child: Opacity(
//                   opacity: 0.5,
//                   child: Image.asset(
//                     'assets/vm_icon.png',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     width: 600, 
//                     height: 50, 
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const CurrentTenantsListScreen()
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(200, 50), 
//                         textStyle: const TextStyle(fontSize: 22), 
//                       ),
//                       child: const Text('Lista de Arrendatarios Actuales'),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 600,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PreviousTenantsHistoryScreen()
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(500, 50),
//                         textStyle: const TextStyle(fontSize: 22),
//                       ),
//                       child: const Text('Historial de Arrendatarios Previos'),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 600,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PreviousTenantsHistoryScreen()
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(500, 50),
//                         textStyle: const TextStyle(fontSize: 22),
//                       ),
//                       child: const Text('Pagos Pendientes de Arrendatarios'),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 600,
//                     height: 50,
//                     child: Tooltip(
//                       message: 'Ver la información de pagos y moras mensuales de un Arrendatario',
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const PreviousTenantsHistoryScreen()
//                             ),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           minimumSize: const Size(500, 50),
//                           textStyle: const TextStyle(fontSize: 22),
//                         ),
//                         child: const Text('Estado de Cuenta de un Arrendatario'),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 600,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PreviousTenantsHistoryScreen()
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(500, 50),
//                         textStyle: const TextStyle(fontSize: 22),
//                       ),
//                       child: const Text('Disponibilidad Viviendas por Ubicación'),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 600,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PreviousTenantsHistoryScreen()
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(500, 50),
//                         textStyle: const TextStyle(fontSize: 22),
//                       ),
//                       child: const Text('Total Cuentas por pagar a proveedor de un Servicio'),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: 600,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const PreviousTenantsHistoryScreen()
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         minimumSize: const Size(500, 50),
//                         textStyle: const TextStyle(fontSize: 22),
//                       ),
//                       child: const Text('Factura por daños ocasionados a la propiedad'),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//       )
//     );
//   }
// }

// class CurrentTenantsListScreen extends StatelessWidget {
//   const CurrentTenantsListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Lista de Arrendatarios Actuales'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//       drawer:  CustomDrawer(isMainScreen: false),
//       body: const Center(
//         child: Text('Aquí va la lista de arrendatarios actuales'),
//       ),
//     );
//   }
// }

// class PreviousTenantsHistoryScreen extends StatelessWidget {
//   const PreviousTenantsHistoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Historial de Arrendatarios Previos'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//       drawer:  CustomDrawer(isMainScreen: false),
//       body: const Center(
//         child: Text('Aquí va el historial de arrendatarios previos'),
//       ),
//     );
//   }
// }

// class SearchRenterScreen extends StatelessWidget {
//   const SearchRenterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Buscar Arrendatario'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//       drawer: CustomDrawer(isMainScreen: false),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image(
//               image: AssetImage('assets/vm_icon.png'),
//               fit: BoxFit.fitHeight,
//               width: 100,
//               height: 100,
//             ),
//             const Text(
//               'Buscar Arrendatarios',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Nombre',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               width: 100, 
//               height: 35,
//               child: MyAppButton(
//                 text: 'Buscar',
//                 onPressed: () {
//                   print('Search by Name button pressed');
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 40),
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Número de Identidad',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               width: 100, 
//               height: 35,
//               child: MyAppButton(
//                 text: 'Buscar',
//                 onPressed: () {
//                   print('Search by Name button pressed');
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchByHousingScreen extends StatelessWidget {
//   const SearchByHousingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Buscar por Vivienda'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//       drawer: CustomDrawer(isMainScreen: false),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image(
//                 image: AssetImage('assets/vm_icon.png'),
//                 fit: BoxFit.fitHeight,
//                 width: 100,
//                 height: 100,
//               ),
//               const Text(
//                 'Filtrar ubicación de la vivienda:',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               DropdownButtonFormField<String>(
//                 decoration: const InputDecoration(
//                   labelText: 'Ubicación',
//                   border: OutlineInputBorder(),
//                 ),
//                 items: [
//                   'Ubicación 1',
//                   'Ubicación 2',
//                   'Ubicación 3',
//                   'Mostrar Todas'
//                 ].map((String location) {
//                   return DropdownMenuItem<String>(
//                     value: location,
//                     child: Text(location),
//                   );
//                 }).toList(),
//                 onChanged: (String? newValue) {},
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 'Buscar por código de vivienda:',
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: 'Código de vivienda',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: SizedBox(
//                   width: 100, 
//                   height: 50, 
//                   child: ElevatedButton(
//                     onPressed: () {
//                       print('Buscar button pressed');
//                     },
//                     child: const Text('Buscar', style: TextStyle(fontSize: 18)), // Adjust font size as needed
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ViewAccountsScreen extends StatelessWidget {
//   const ViewAccountsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ver Estado de Cuentas'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//       drawer:  CustomDrawer(isMainScreen: false),
//       body: const Center(
//         child: Text('View Accounts Screen'),
//       ),
//     );
//   }
// }

// class ViewPendingAccountsScreen extends StatelessWidget {
//   const ViewPendingAccountsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Ver Cuentas Pendientes'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//       drawer:  CustomDrawer(isMainScreen: false),
//       body: const Center(
//         child: Text('View Pending Accounts Screen'),
//       ),
//     );
//   }
// }

