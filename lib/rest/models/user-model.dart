import 'dart:convert';

import 'package:schwarzit/rest/models/address-model.dart';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.address});

  int id;
  String firstName;
  String lastName;
  AddressModel address;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var adressJson = json['address'] as Map<String, dynamic>;
    var address = AddressModel.fromJson(adressJson);
    return UserModel(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      address: address,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
      };
}
