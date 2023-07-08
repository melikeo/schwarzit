import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:schwarzit/rest/models/article-model.dart';
import 'package:schwarzit/rest/constants.dart';

class ApiService {
  Future<List<ArticleModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.articleEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<ArticleModel> _model = articleModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}