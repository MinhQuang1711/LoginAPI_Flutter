import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:homework2/api/const_api.dart';

import '../product_model/product_model.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static List<ProductModel> parseProduct(String reponseBody) {
    //TODO
    var list = json.decode(reponseBody) as List<dynamic>;
    List<ProductModel> post =
        list.map((e) => ProductModel.formJson(e)).toList();
    return post;
  }

  static Future<List<ProductModel>> fetchProduct() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return compute(parseProduct, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not found');
    } else {
      throw Exception('Can\'t get post');
    }
  }

  static Future<dynamic> postProduct(
      String productName, String imageUrl, double ratting, double price) async {
    final response = await http.post(Uri.parse(apiUrl), body: {
      "productName": productName,
      "imageUrl": imageUrl,
      "price": price.toString(),
      "rating": ratting.toString(),
    });
    if (response.statusCode == 200) {
      print('Success');
      return response.body;
    } else if (response.statusCode == 201) {
      print('Success');
    } else {
      throw Exception('Error');
    }
  }
}
