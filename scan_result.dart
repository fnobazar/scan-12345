class ScanResult {
  final String type;
  final String name;
  final double confidence;
  final String summary;
  final Map<String, dynamic> specs;
  final List<String> pros;
  final List<String> cons;
  final String? safety;
  final String? history;
  final List<String> nearby;
  final String imagePath;

  ScanResult({
    required this.type,
    required this.name,
    required this.confidence,
    required this.summary,
    this.specs = const {},
    this.pros = const [],
    this.cons = const [],
    this.safety,
    this.history,
    this.nearby = const [],
    required this.imagePath,
  });

  factory ScanResult.fromJson(Map<String, dynamic> json) {
    return ScanResult(
      type: json['type'] ?? 'unknown',
      name: json['name'] ?? 'Unknown',
      confidence: (json['confidence'] ?? 0.8).toDouble(),
      summary: json['summary'] ?? '',
      specs: json['specs'] ?? {},
      pros: List<String>.from(json['pros'] ?? []),
      cons: List<String>.from(json['cons'] ?? []),
      safety: json['safety'],
      history: json['history'],
      nearby: List<String>.from(json['nearby'] ?? []),
      imagePath: json['imagePath'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'type': type,
    'name': name,
    'confidence': confidence,
    'summary': summary,
    'specs': specs,
    'pros': pros,
    'cons': cons,
    'safety': safety,
    'history': history,
    'nearby': nearby,
    'imagePath': imagePath,
  };
}
