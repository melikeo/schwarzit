import 'dart:convert';

List<ProductsModel> articleModelFromJson(String str) =>
    List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String articleModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
    required this.id,
    required this.name,
    this.brand,
    this.pack,
    this.price,
    this.eans,
  });

  int id;
  String name;
  String? brand;
  String? pack;
  double? price;
  String? eans;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    id: json["id"],
    name: json["name"],
    brand: json["brand"],
    pack: json["pack"],
    price: json["price"],
    eans: json["eans"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "brand": brand,
    "pack": pack,
    "price": price,
    "eans": eans,
  };
}