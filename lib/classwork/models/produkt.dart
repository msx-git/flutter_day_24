import 'package:json_annotation/json_annotation.dart';

part 'produkt.g.dart';

@JsonSerializable()
class Produkt {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final Map<String, dynamic> rating;

  const Produkt({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Produkt.fromJson(Map<String, dynamic> json) {
    return _$ProduktFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProduktToJson(this);
  }
}
