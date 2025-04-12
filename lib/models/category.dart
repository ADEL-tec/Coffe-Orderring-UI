import 'dart:convert';

import 'package:coffee_ordering/models/coffee.dart';

class MyCategory {
  final String name;
  final List<Coffee> coffeList;

  MyCategory({required this.name, required this.coffeList});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'coffeList': coffeList.map((x) => x.toMap()).toList(),
    };
  }

  factory MyCategory.fromMap(Map<String, dynamic> map) {
    return MyCategory(
      name: map['name'] as String,
      coffeList: List<Coffee>.from(
        (map['coffeList'] as List<int>).map<Coffee>(
          (x) => Coffee.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MyCategory.fromJson(String source) =>
      MyCategory.fromMap(json.decode(source) as Map<String, dynamic>);
}
