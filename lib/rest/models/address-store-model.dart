import 'dart:convert';

List<AddressStoreModel> addressStoreModelFromJson(String str) =>
    List<AddressStoreModel>.from(json.decode(str).map((x) => AddressStoreModel.fromJson(x)));

String addressStoreModelToJson(List<AddressStoreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressStoreModel {
  @override
  String toString() {
    return this.street + '\n' + this.postcode + ' ' + this.city;
  }

  AddressStoreModel({
    required this.countryCode,
    required this.postcode,
    required this.city,
    required this.street
  });

  String countryCode;
  String postcode;
  String city;
  String street;


  factory AddressStoreModel.fromJson(Map<String, dynamic> json) => AddressStoreModel(
    countryCode: json["countryCode"],
    postcode: json["postcode"],
    city: json["city"],
    street: json["street"],
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode,
    "postcode": postcode,
    "city": city,
    "street": street,
  };
}