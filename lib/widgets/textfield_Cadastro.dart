import 'package:flutter/material.dart';

class TextfieldCadastro extends StatelessWidget {
  const TextfieldCadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Digite seu'
      ),
    );
  }
}