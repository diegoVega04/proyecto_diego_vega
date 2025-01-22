import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:proyecto_diego_vega/db.dart';
import 'package:proyecto_diego_vega/models.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});
  
  @override
  State<StatefulWidget> createState() => _Principal();
}

class _Principal extends State<Principal> {
  
  int _currentIndex = 1;
  final List<Widget> _screens = [
    //LibrosLeidos(),
    const Inicio(),
    const Inicio(),
    const Inicio(),
    //BuscarLibro(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Center(child: Text("MyBooks"))),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Mis Libros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
      ),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});
  
  @override
  State<StatefulWidget> createState() => _Inicio();
}

class _Inicio extends State<Inicio> {

  @override
  Widget build(BuildContext context) {
    final sesion = Provider.of<Sesion>(context, listen: false);

    return Center(child: Text(sesion.user!.toString()));
  }
}