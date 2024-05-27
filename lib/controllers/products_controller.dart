import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_day_24/models/product.dart';
import 'package:http/http.dart' as http;

class ProductsController {
  final List<Product> _list = [];

  List<Product> get products => [..._list];

  Future<void> getProducts() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    try {
      final response = await http.get(url);
      if (response.statusCode == 404) {
        throw Exception("Not found");
      } else if (response.statusCode != 200) {
        throw Exception("Error while fetching data");
      }
      final data = jsonDecode(response.body);
      for (var product in data) {
        _list.add(Product.fromJson(product));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
