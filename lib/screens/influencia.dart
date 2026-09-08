import 'package:flutter/material.dart';
import '../models/capture_motion.dart';
import 'seletor.dart';
import '../services/storage_service.dart';
import 'historico.dart';

class Influencia extends StatefulWidget {
  final String emocao;

  const Influencia({super.key, required this.emocao});

  @override
  State<Influencia> createState() => _InfluenciaState();
}

class _InfluenciaState extends State<Influencia> {
  late String emocaoAtual;

  @override
  void initState(){
    super.initState();
    emocaoAtual = widget.emocao;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 75),

          Text('o que',
          style: TextStyle(
            fontSize: 35
          ),
          ),

          Text('influenciou?',
          style: TextStyle(
            fontSize: 35
          ),
          ),

          GestureDetector(
            onTap: () async {
              final resultado = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Seletor(trocandoEmocao: true),
          ),
        );

        if (resultado != null) {
          setState(() {
            emocaoAtual = resultado;
          });
        }
      },
      child: Column(
        children: [
        Image.asset(
        'assets/emocoes/$emocaoAtual.png',
        width: 200,
        ),

        SizedBox(height: 10),

        Text(
        'Clique para alterar',
        style: TextStyle(
                    fontFamily: 'KyivTypeSans',
                    fontWeight: FontWeight.w300,
                    fontSize: 15,
                    color: Colors.grey
                    )
                    ),
        ])
    ),

          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [
              for (final influencia in influencias)
                _buildInfluencia(
                asset: influencia['asset']!,
                nome: influencia['nome']!,
                emocaoAtual: emocaoAtual,
                context: context,
                  ),
              ],
            ),
          ),

          Text('PAUSA',
          style: TextStyle(
            fontFamily: 'KyivTypeSans',
            fontWeight: FontWeight.w300,
            fontSize: 25,
            color: Colors.grey
          ),
          ),

          SizedBox(height: 25),
        ],
      ),
    );
  }
}

Widget _buildInfluencia({
  required String asset,
  required String nome,
  required String emocaoAtual,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () async {
      final captura = CaptureMotion(
        emocao: emocaoAtual,
        influencia: nome,
        horario: DateTime.now(),
      );

      await salvarCaptureMotion(captura);

      if (context.mounted) {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Historico()),
    );
    }

    },
    child: Image.asset(
      asset,
      width: 70,
    )
    );
}

final influencias = [
  {'asset': 'assets/influencias/placeholder.png', 'nome': 'trabalho'},
  {'asset': 'assets/influencias/placeholder.png', 'nome': 'estudos'},
  {'asset': 'assets/influencias/placeholder.png', 'nome': 'amor'},
  {'asset': 'assets/influencias/placeholder.png', 'nome': 'hobby'},
  {'asset': 'assets/influencias/placeholder.png', 'nome': 'familia'},
  {'asset': 'assets/influencias/placeholder.png', 'nome': 'amigos'},
  {'asset': 'assets/influencias/placeholder.png', 'nome': 'esporte'},
  {'asset': 'assets/influencias/placeholder.png', 'nome': 'sono'},
];