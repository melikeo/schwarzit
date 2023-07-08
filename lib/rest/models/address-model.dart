import 'dart:convert';

List<AddressModel> addressModelFromJson(String str) =>
    List<AddressModel>.from(json.decode(str).map((x) => AddressModel.fromJson(x)));

String addressModelToJson(List<AddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressModel {
  @override
  String toString() {
    return this.street + '\n' + this.zipCode + ' ' + this.city;
  }

  AddressModel({
    required this.countryCode,
    required this.zipCode,
    required this.city,
    required this.street
  });

  String countryCode;
  String zipCode;
  String city;
  String street;


  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    countryCode: json["countryCode"],
    zipCode: json["zipCode"],
    city: json["city"],
    street: json["street"],
  );

  Map<String, dynamic> toJson() => {
    "countryCode": countryCode,
    "zipCode": zipCode,
    "city": city,
    "street": street,
  };
}