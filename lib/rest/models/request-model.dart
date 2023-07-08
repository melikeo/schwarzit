import 'dart:convert';
import 'order-items-model.dart';

List<RequestModel> requestModelFromJson(String str) =>
    List<RequestModel>.from(json.decode(str).map((x) => RequestModel.fromJson(x)));

String requestModelToJson(List<RequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestModel {
  RequestModel({
    required this.id,
    required this.nameOfTheRequester,
    required this.shoppinglist,
    required this.status,
    this.deadline
  });

  String id;
  String nameOfTheRequester;
  List<OrderItemsModel> shoppinglist;
  String status;
  String? deadline;

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    var shoppinglistJson = json['shoppinglist'] as List<dynamic>;
    return RequestModel(
      id: json["id"],
      nameOfTheRequester: json["nameOfTheRequester"],
        shoppinglist: List<OrderItemsModel>.from(
          shoppinglistJson.map(
                (item) => OrderItemsModel.fromJson(item),
          ),
        ),
      status:  json["status"],
      deadline: json["deadline"]
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameOfTheRequester": nameOfTheRequester,
    "shoppinglist": shoppinglist,
    "status": status,
    "deadline": deadline
  };
}