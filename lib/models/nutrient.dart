import 'package:flutter/material.dart';
import 'package:flutter_charts_example/constants/colors.dart';

class Nutrient {
  String type;
  num value;
  String unit;
  Nutrient({this.type, this.value, this.unit});
  Color color;

  Nutrient.fromJson(Map<String, dynamic> json) {
    type = json['type'] as String;
    value = ((json['value'] ?? 0) as num).ceil();
    unit = json['unit'] as String;
  }
  static fromJsonList(List<Map<String, dynamic>> json) {
    {
      final data = <Nutrient>[];
      json.asMap().forEach((key, value) {
        data.add(Nutrient.fromJson(value)..color = chartColors[key]);
      });
      return data;
    }
  }
}

final List<Map<String, dynamic>> json = [
  {"type": "Calories", "value": 112, "unit": "kcal"},
  {"type": "Total", "value": 24, "unit": "g"},
  {"type": "Carbohydrate", "value": 17.04, "unit": "g"},
  {"type": "Sugar", "value": 9.76, "unit": "g"},
  {"type": "Fat", "value": 4.59, "unit": "g"},
  {"type": "Saturated Fat", "value": 1.36, "unit": "g"},
  {"type": "Protein", "value": 1.25, "unit": "g"},
  {"type": "Dietary Fiber", "value": 0.7, "unit": "g"},
  {"type": "Sodium", "value": 93.12, "unit": "mg"},
  {"type": "Potassium", "value": 56.16, "unit": "mg"},
  {"type": "Phosphorous", "value": 22.32, "unit": "mg"},
  {"type": "Cholesterol", "value": 0, "unit": "mg"}
];
final nutrients = Nutrient.fromJsonList(json);
