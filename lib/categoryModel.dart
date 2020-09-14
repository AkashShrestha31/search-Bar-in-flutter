// To parse this JSON data, do
//
//     final items = itemsFromMap(jsonString);

import 'dart:convert';

List<Items> itemsFromMap(String str) =>
    List<Items>.from(json.decode(str).map((x) => Items.fromMap(x)));

String itemsToMap(List<Items> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Items {
  Items({
    this.category,
    this.img,
  });

  String category;
  String img;

  factory Items.fromMap(Map<String, dynamic> json) => Items(
        category: json["Category"],
        img: json["img"],
      );

  Map<String, dynamic> toMap() => {
        "Category": category,
        "img": img,
      };
}
