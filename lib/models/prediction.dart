import 'dart:convert';

Prediction predictionFromJson(String str) => Prediction.fromJson(json.decode(str));

String predictionToJson(Prediction data) => json.encode(data.toJson());

class Prediction {
  String? reading;

  Prediction({
    required this.reading,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) {
    return Prediction(
      reading: json["reading"],
    );
  }

  Map<String, dynamic> toJson() => {
    "reading": reading,
  };
}

