import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto_diego_vega/widgets.dart';


void main() async{
  runApp(const MaterialApp(home: Login()));
}

class Login extends StatefulWidget {
  const Login({super.key});
  
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("MyBooks"))),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          
          Contenedor(label: "Boton iniciar sesion", hint: "Apriete el boton para iniciar sesion", margen: 4, padding: 8, 
          a: ElevatedButton(
            onPressed: () {
              //aaa
            }, 
            child: Text("Iniciar sesion"))),
          
          Contenedor(label: "Boton crear cuenta", hint: "Apriete el boton para crear una nueva cuenta", margen: 4, padding: 8, 
          a: ElevatedButton(
            onPressed: () {
              //aaa
            }, 
            child: Text("Crear cuenta")))
        ],),
      )
    );
  }
}