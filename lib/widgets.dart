import 'package:flutter/material.dart';

class Contenedor extends StatelessWidget {
  final String label;
  final String hint;
  final double margen;
  final double padding;
  final Widget a;

  Contenedor({required this.label, required this.hint, required this.margen, required this.padding, required this.a});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      hint: hint,
      child: Container(
        margin: EdgeInsets.all(margen),
        padding: EdgeInsets.all(padding),
        child: a,
      ),
    );
  }
}