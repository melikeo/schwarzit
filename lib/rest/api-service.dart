import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:schwarzit/rest/models/products-model.dart';
import 'package:schwarzit/rest/constants.dart';

class ApiService {
  static Future<List<ProductsModel>?> getProducts() async {
    print('test');
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
}