import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
//import 'package:proyecto_diego_vega/db.dart';
import 'package:proyecto_diego_vega/models.dart';
import 'package:proyecto_diego_vega/pantallas.dart';
import 'package:window_size/window_size.dart';
import 'package:proyecto_diego_vega/widgets.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowFrame(const Rect.fromLTWH(700, 100, 430, 826));
  }
  
  runApp(ChangeNotifierProvider(
    create: (context) => Sesion(),
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Inicio(),
  )));
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sesion = Provider.of<Sesion>(context, listen: false);
    
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("MyBooks"))),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          
          Contenedor(label: "Boton iniciar sesion", hint: "Apriete el boton para iniciar sesion", margen: 4, padding: 8, 
          a: ElevatedButton(
            onPressed: () {
              sesion.login(Usuario(id: 0, nombre: "Diego", apellidos: "Vega", nombreUsuario: "user1", password: "1234", email: "user1@gmail.com"));
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Principal()),);
            }, 
            child: const Text("Iniciar sesion"))),
          
          Contenedor(label: "Boton crear cuenta", hint: "Apriete el boton para crear una nueva cuenta", margen: 4, padding: 8, 
          a: ElevatedButton(
            onPressed: () {
              sesion.login(Usuario(id: 0, nombre: "Diego", apellidos: "Vega", nombreUsuario: "user1", password: "1234", email: "user1@gmail.com"));
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
    return Scaffold(
      appBar: AppBar(title: Text("Inicio de sesion")),
      body: Center(
        child: usuarios.isEmpty
        ? CircularProgressIndicator()
        : Row(children: [
          Column(children: [
            Contenedor(label: "nombre usuario", hint: "introduzca nombre de usaurio", margen: 10, padding: 0, 
            a: TextField(
              controller: _conName,
            )),
            Contenedor(label: "contraseña", hint: "introduzca su contraseña", margen: 10, padding: 0, 
            a: TextField(
              controller: _conPass,
            ))
          ],),
          IconButton(
            onPressed: () {

            }, 
            icon: Icon(Icons.send))
        ],)
      )
      );}
  
  bool comprobarDatos(nom, pass) {

    return true;
  }
}