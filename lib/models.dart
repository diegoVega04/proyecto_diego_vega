import 'package:flutter/material.dart';

class Libro {
  final int id;
  final String nombre;
  final DateTime publicacion;
  final String genero;
  final String descripcion;

  Libro({
    required this.id,
    required this.nombre,
    required this.publicacion,
    required this.genero,
    required this.descripcion,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'publicacion': publicacion.toIso8601String(),
      'genero': genero,
      'descripcion': descripcion,
    };
  }
}

class Usuario {
  final int id;
  final String nombre;
  final String apellidos;
  final String nombreUsuario;
  final String password;
  final String email;

  Usuario({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.nombreUsuario,
    required this.password,
    required this.email
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre_usuario': nombreUsuario,
      'password': password,
      'email': email
    };
  }
}

class LibroUsuario {
  final int id_usuario;
  final int id_libro;
  final int nota;
  final String opinion;

  LibroUsuario({
    required this.id_usuario,
    required this.id_libro,
    required this.nota,
    required this.opinion,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_usuario': id_usuario,
      'id_libro': id_libro,
      'nota': nota,
      'opinion': opinion,
    };
  }
}

class Sesion with ChangeNotifier {
  Usuario? user;

  void login(Usuario u) {
    user = u;
    notifyListeners();
  }

  void logout(){
    user = null;
    notifyListeners();
  }
}