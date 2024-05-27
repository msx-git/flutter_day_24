import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/produkt.dart';

class ProduktsController {
  final List<Produkt> _list = [];

  List<Produkt> get produkts => [..._list];

  Future<void> getProdukts() async {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    try {
      final response = await http.get(url);
      if (response.statusCode == 404) {
        throw Exception("Not found");
      } else if (response.statusCode != 200) {
        throw Exception("Error while fetching data");
      }
      final data = jsonDecode(response.body);
      for (var produkt in data) {
        _list.add(Produkt.fromJson(produkt));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
