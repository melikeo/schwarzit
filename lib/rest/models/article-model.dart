import 'dart:convert';

List<ArticleModel> articleModelFromJson(String str) =>
    List<ArticleModel>.from(json.decode(str).map((x) => ArticleModel.fromJson(x)));

String articleModelToJson(List<ArticleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArticleModel {
  ArticleModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}