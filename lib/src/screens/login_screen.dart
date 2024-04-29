import 'package:flutter/material.dart';
import '../shared/constantes.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  String? _username, _password;
  bool _loginError = false;
  AnimationController? _shakeController;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!= null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_username == 'Admin' && _password == '123456789') {
        print('Login Successful!');
        setState(() {
          _loginError = false;
        });
        Navigator.pushNamed(context, Rutas.menuPrincipal.name);
      } else {
        print('Invalid username or password');
        setState(() {
          _loginError = true;
        });
        _shake();
      }
    }
  }

  void _shake() {
    _shakeController?.reset();
    _shakeController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: KeyboardListener(
          focusNode: _focusNode,
          onKeyEvent: (event) {
            if (event.logicalKey == LogicalKeyboardKey.enter) {
              _handleLogin();
            }
          },
          child: AnimatedBuilder(
            animation: _shakeController!,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 300.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: 300,
                        child: Image(
                          image: AssetImage('assets/vm_icon.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Inicio de Sesión',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu nombre de Usuario';
                          }
                          return null;
                        },
                        onSaved: (value) => _username = value,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingresa tu Contraseña';
                          }
                          return null;
                        },
                        onSaved: (value) => _password = value,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: _handleLogin,
                          child: const Text('Entrar'),
                        ),
                      ),
                      if (_loginError)
                        const Text(
                          'Usuario o contraseña incorrectos',
                          style: TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                  _shakeController!.value * 10,
                  0,
                ),
                child: child,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _shakeController?.dispose();
    super.dispose();
  }
}