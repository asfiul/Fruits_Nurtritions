import 'package:meta/meta.dart';
import 'dart:convert';

//List<FruitsData> fruitsDataFromJson(String str) => List<FruitsData>.from(json.decode(str).map((x) => FruitsData.fromJson(x)));

class FruitsData {
  final String genus;
  final String name;
  final int id;
  final String family;
  final String order;
  final Nutritions nutritions;

  FruitsData({
    @required this.genus,
    @required this.name,
    @required this.id,
    @required this.family,
    @required this.order,
    @required this.nutritions,
  });

  factory FruitsData.fromJson(Map<String, dynamic> json) => FruitsData(
        genus: json["genus"],
        name: json["name"],
        id: json["id"],
        family: json["family"],
        order: json["order"],
        nutritions: Nutritions.fromJson(json["nutritions"]),
      );
}

class Nutritions {
  final double carbohydrates;
  final double protein;
  final double fat;
  final int calories;
  final double sugar;

  Nutritions({
    @required this.carbohydrates,
    @required this.protein,
    @required this.fat,
    @required this.calories,
    @required this.sugar,
  });

  factory Nutritions.fromJson(Map<String, dynamic> json) => Nutritions(
        carbohydrates: json["carbohydrates"].toDouble(),
        protein: json["protein"].toDouble(),
        fat: json["fat"].toDouble(),
        calories: json["calories"],
        sugar: json["sugar"].toDouble(),
      );
}
