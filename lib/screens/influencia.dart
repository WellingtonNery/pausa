import 'package:flutter/material.dart';
import 'seletor.dart';
import 'dart:convert';

class Influencia extends StatelessWidget {
  final String emocaoJson;

  const Influencia({super.key, required this.emocaoJson});

  @override
  Widget build(BuildContext context) {
    final captura = CaptureMotion.fromJson(jsonDecode(emocaoJson));

    return Scaffold(
      body: Column(
        children:[
          SizedBox(height: 200), 
          Text('Emoção: ${captura.emocao}'),
          Text('Horário: ${captura.horario}'),
        ]),
);

    
  }
}