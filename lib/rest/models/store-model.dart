import 'dart:convert';

import 'address-store-model.dart';

List<StoreModel> storeModelFromJson(String str) =>
    List<StoreModel>.from(json.decode(str).map((x) => StoreModel.fromJson(x)));

String storeModelToJson(List<StoreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreModel {
  StoreModel({
    required this.id,
    required this.address,
  });

  int id;
  AddressStoreModel address;



  factory StoreModel.fromJson(Map<String, dynamic> json) {
    var productJson = json['address'] as Map<String, dynamic>;
    var product = AddressStoreModel.fromJson(productJson);
    return StoreModel(
      id: json["id"],
      address: product,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
  };
}