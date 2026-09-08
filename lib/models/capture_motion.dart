class CaptureMotion {
  final String emocao;
  final String influencia;
  final DateTime horario;

  CaptureMotion({
    required this.emocao,
    required this.horario,
    required this.influencia,
  });

  Map<String, dynamic> toJson() {
    return {
      'emocao': emocao,
      'influencia': influencia,
      'horario': horario.toIso8601String(),
    };
  }

  factory CaptureMotion.fromJson(Map<String, dynamic> json) {
    return CaptureMotion(
      emocao: json['emocao'],
      influencia: json['influencia'],
      horario: DateTime.parse(json['horario']),
    );
  }
}