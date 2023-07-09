import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:schwarzit/rest/models/products-model.dart';
import 'package:schwarzit/rest/constants.dart';
import 'package:schwarzit/rest/models/request-model.dart';
import 'package:schwarzit/rest/models/store-model.dart';
import 'package:schwarzit/rest/models/user-model.dart';

class ApiService {
  static Future<List<ProductsModel>?> getProducts() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.productsEndpoint);

      var response = await http.get(url);

      if (response.statusCode == 201) {

        List<ProductsModel> _model = articleModelFromJson(response.body);

        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
  static Future<List<RequestModel>?> getRequests() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.requestEndpoint);

      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('worked');
        List<RequestModel> _model = requestModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
  static Future<UserModel?> getMe() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.customerEndpoint);

      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('worked');
        UserModel _model = userModelFromJson(response.body).where((element) => element.lastName == 'Kuhlee').first;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<UserModel?> getCustomerByName(String name) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.customerEndpoint);

      var response = await http.get(url);
      if (response.statusCode == 201) {
        List<String> splitted = name.split(' ');
        UserModel _model = userModelFromJson(response.body).where((element) => element.firstName == splitted[0] && element.lastName == splitted[1]).first;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
  static Future<StoreModel?> getNearestStore(String address) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.storeEndpoint);

      var response = await http.get(url);
      if (response.statusCode == 201) {

        StoreModel _model = storeModelFromJson(response.body).first;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
  static Future<List<ProductsModel>?> getProductsByRequest(String id) async {
    try {
      print(id);
      var url1 = Uri.parse(ApiConstants.baseUrl + ApiConstants.requestEndpoint);

      var response1 = await http.get(url1);

      if (response1.statusCode == 200) {
        RequestModel _model = requestModelFromJson(response1.body).where((element) => element.id == id).first;
        print(_model.id);
        print('ze');
        List<String> ids = [];
        _model.shoppinglist.forEach((element) {ids.add(element.product.id.toString());});
        print(ids);

        var url2 = Uri.parse(ApiConstants.baseUrl + ApiConstants.productsEndpoint);

        var response2 = await http.get(url2);

        if (response2.statusCode == 201) {
          print('worked6');
          print('jej');
          List<ProductsModel> _modellist = articleModelFromJson(response2.body);
          List<ProductsModel> filtered = [];
          _modellist.forEach((element) {
            ids.forEach((x) {
                if(x == element.id.toString()) {
                  print('ssss');
                  filtered.add(element);
                }
            }) ;
          });
          print(filtered.isEmpty);
          return filtered;
        }

      }
    } catch (e) {
      log(e.toString());
    }
  }
}