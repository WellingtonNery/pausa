import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/capture_motion.dart';

Future<void> salvarCaptureMotion(CaptureMotion captura) async {
  final prefs = await SharedPreferences.getInstance();

  final listaAtual = prefs.getStringList('capturas') ?? [];

  listaAtual.add(jsonEncode(captura.toJson()));

  await prefs.setStringList('capturas', listaAtual);
}