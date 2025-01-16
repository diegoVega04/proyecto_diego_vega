import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
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
        home: const Login(),
  )));
}

class Login extends StatefulWidget {
  const Login({super.key});
  
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {

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