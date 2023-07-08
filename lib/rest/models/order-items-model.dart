import 'dart:convert';

import 'package:schwarzit/rest/models/products-model.dart';

List<OrderItemsModel> orderItemsModelFromJson(String str) =>
    List<OrderItemsModel>.from(json.decode(str).map((x) => OrderItemsModel.fromJson(x)));

String orderItemsModelToJson(List<OrderItemsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderItemsModel {
  OrderItemsModel({
    required this.product,
    required this.quantity
  });

  ProductsModel product;
  int quantity;

  factory OrderItemsModel.fromJson(Map<String, dynamic> json) {
    var productJson = json['product'] as Map<String, dynamic>;
    var product = ProductsModel.fromJson(productJson);
    return OrderItemsModel(
        product: product,
        quantity: json["quantity"]);
  }

  Map<String, dynamic> toJson() => {
    "product": product,
    "quantity": quantity,
  };
}