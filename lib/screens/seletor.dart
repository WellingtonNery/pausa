import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'influencia.dart';

class Seletor extends StatelessWidget {
  const Seletor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          SizedBox(height: 75),

          Text(
            'como você',
            style: TextStyle(
              fontSize: 35
          )
          ),
          
          Text(
            'está                   hoje?',
            style: TextStyle(
              fontSize: 35
          )
          ),

          SizedBox(height: 50),

          const EmotionCircle(),

          SizedBox(height: 135),

          Text('PAUSA',
          style: TextStyle(
            fontFamily: 'KyivTypeSans',
            fontWeight: FontWeight.w300,
            fontSize: 25
          )
          ), 
        ],
      ),
    );
  }
}

class EmotionCircle extends StatelessWidget {
  const EmotionCircle({super.key});

  @override
  Widget build(BuildContext context) {
    const double size = 360;   
    const double radius = 130; 
    const double itemSize = 70; 

    final emotions = [
      {'asset': 'assets/emocoes/triste.png', 'angle': -90.0, 'nome': 'triste'},
      {'asset': 'assets/emocoes/bravo.png', 'angle': -45.0, 'nome': 'bravo'},
      {'asset': 'assets/emocoes/entediado.png', 'angle': 0.0, 'nome': 'entediado'},
      {'asset': 'assets/emocoes/feliz.png', 'angle': 45.0, 'nome': 'feliz'},
      {'asset': 'assets/emocoes/calmo.png', 'angle': 90.0, 'nome': 'calmo'},
      {'asset': 'assets/emocoes/apaixonado.png', 'angle': 135.0, 'nome': 'apaixonado'},
      {'asset': 'assets/emocoes/ansioso.png', 'angle': 180.0, 'nome': 'ansioso'},
      {'asset': 'assets/emocoes/cansado.png', 'angle': -135.0, 'nome': 'cansado'},
    ];

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          for (final emotion in emotions)
            _buildPositionedEmotion(
              context: context,
              asset: emotion['asset'] as String,
              nome: emotion['nome'] as String,
              angleDegrees: emotion['angle'] as double,
              size: size,
              radius: radius,
              itemSize: itemSize,
            ),
        ],
      ),
    );
  }

  Widget _buildPositionedEmotion({
    required BuildContext context,
    required String asset,
    required String nome,
    required double angleDegrees,
    required double size,
    required double radius,
    required double itemSize,
  }) {
    final double angleRad = angleDegrees * pi / 180;
    final double centerX = size / 2;
    final double centerY = size / 2;

    final double x = centerX + radius * cos(angleRad) - itemSize / 2;
    final double y = centerY + radius * sin(angleRad) - itemSize / 2;

    return Positioned(
      left: x,
      top: y,
      child: GestureDetector(
      onTap: () {
        final captura = CaptureMotion(
          emocao: nome,
          horario: DateTime.now(),
        );

        final jsonString = jsonEncode(captura.toJson());

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Influencia(emocaoJson: jsonString),
          ),
        );
      },
      child: Image.asset(asset, width: itemSize),
    ),
    );
  }
}

//

class CaptureMotion {
  final String emocao;
  final DateTime horario;

  CaptureMotion({
    required this.emocao,
    required this.horario,
  });

  Map<String, dynamic> toJson() {
    return {
      'emocao': emocao,
      'horario': horario.toIso8601String(),
    };
  }

  factory CaptureMotion.fromJson(Map<String, dynamic> json) {
    return CaptureMotion(
      emocao: json['emocao'],
      horario: DateTime.parse(json['horario']),
    );
  }
}