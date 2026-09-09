import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/capture_motion.dart';
import 'package:intl/intl.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  List<CaptureMotion> capturas = [];

  @override
  void initState() {
    super.initState();
    _carregarCapturas();
  }

  Future<void> _carregarCapturas() async {
    final prefs = await SharedPreferences.getInstance();
    final listaSalva = prefs.getStringList('capturas') ?? [];

    setState(() {
      capturas = listaSalva
          .map((item) => CaptureMotion.fromJson(jsonDecode(item)))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),

            Text(
              'historico\nsentimental',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),

            SizedBox(height: 30),

            Expanded(
              child: capturas.isEmpty
                  ? const Center(child: Text('Nenhum registro encontrado.'))
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.55,
                      ),
                      itemCount: capturas.length,
                      itemBuilder: (context, index) {
                        final captura = capturas[index];
                        return Column(
                          children: [
                            Image.asset(
                              'assets/emocoes/${captura.emocao}.png',
                              width: 70,
                              height: 70,
                            ),
                            const SizedBox(height: 4),

                             Text(
                              '${captura.influencia}',
                              style: TextStyle(fontSize: 12),
                            ),

                            Text(
                              DateFormat('dd/MM').format(captura.horario),
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        );
                      },
                    ),
            ),

            SizedBox(height: 25),

            Text('PAUSA',
            style: TextStyle(
            fontFamily: 'KyivTypeSans',
            fontWeight: FontWeight.w300,
            fontSize: 25,
            color: Colors.grey
            ),
            ),

            SizedBox(height: 13),
          ],
        ),
      ),
    );
  }
}