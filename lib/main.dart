import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'services/storage_service.dart'; // ajuste pro caminho real do seu arquivo

void main(){

  runApp(const PausaApp());
}

class PausaApp extends StatelessWidget {
  const PausaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PAUSA',
      home: const Home(),
    );
  }
}