import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_diego_vega/db.dart';
import 'package:proyecto_diego_vega/models.dart';
import 'package:proyecto_diego_vega/pantallas.dart';
import 'package:window_size/window_size.dart';
import 'package:proyecto_diego_vega/widgets.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {setWindowFrame(const Rect.fromLTWH(700, 100, 430, 826));}
  
  runApp(ChangeNotifierProvider(
    create: (context) => Sesion(),
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BotonesInicio(),
  )));
}

class BotonesInicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("MyBooks"))),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          
          Contenedor(label: "Boton iniciar sesion", hint: "Apriete el boton para iniciar sesion", margen: 4, padding: 8, 
          a: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),);
            }, 
            child: const Text("Iniciar sesion"))),
          
          Contenedor(label: "Boton crear cuenta", hint: "Apriete el boton para crear una nueva cuenta", margen: 4, padding: 8, 
          a: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Principal()),);
            }, 
            child: const Text("Crear cuenta")))
        ],),
      )
    );
  }
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  List<Usuario> usuarios = [];
  TextEditingController _conName = TextEditingController();
  TextEditingController _conPass = TextEditingController();
  var _errorNombre = null;
  var _errorPass = null;


  @override
  void initState() {
    super.initState();
    _cargarDatos();
  }

  Future<void> _cargarDatos() async {
    List<Usuario> a = await Db.getUsuarios();
    setState(() {
      usuarios = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    final sesion = Provider.of<Sesion>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("Inicio de sesion")),
      body: Center(
        child: usuarios.isEmpty
        ? CircularProgressIndicator()
        : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Contenedor(label: "nombre usuario", hint: "introduzca nombre de usaurio", margen: 10, padding: 0, 
            a: SizedBox(width: 150, child: TextField(
              onTap: () => setState(() {
                _errorNombre = null;
              }),
              controller: _conName,
              decoration: InputDecoration(
                errorText: _errorNombre
              ),
            ))),
            Contenedor(label: "contraseña", hint: "introduzca su contraseña", margen: 10, padding: 0, 
            a: SizedBox(width: 150, child: TextField(
              onTap: () => setState(() {
                _errorPass = null;
              }),
              controller: _conPass,
              obscureText: true,
              decoration: InputDecoration(errorText: _errorPass)
            ))),
            IconButton(
              onPressed: () {
                bool usuarioEncontrado = false;

                for (var user in usuarios) {
                  if (user.nombreUsuario == _conName.text) {
                    usuarioEncontrado = true;
                    if (user.password == _conPass.text) {
                      sesion.login(user);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Principal()),
                        (Route<dynamic> route) => false);
                      return;
                    } else {
                      setState(() {
                        _errorPass = "La contraseña es incorrecta";
                        _errorNombre = null;
                      });
                      return;
                    }
                  }
                }

                if (!usuarioEncontrado) {
                  setState(() {
                    _errorNombre = "El usuario no existe";
                    _errorPass = null;
                  });
                }
              }, 
              icon: Icon(Icons.send))
      ]))
      );}
}