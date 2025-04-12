// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Coffee {
  final String id;
  final String name;
  final String description;
  final String image;
  final int volume;
  final double price;

  Coffee({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.volume,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'volume': volume,
      'price': price,
    };
  }

  factory Coffee.fromMap(Map<String, dynamic> map) {
    return Coffee(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      volume: map['volume'] as int,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coffee.fromJson(String source) =>
      Coffee.fromMap(json.decode(source) as Map<String, dynamic>);
}
