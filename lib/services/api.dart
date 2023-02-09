import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class Api {
  static const baseUrl = "http://localhost:3000/api";

  Future<void> addProduct(RxList<Product> data) async {
    var url = Uri.parse("$baseUrl/product");

    try {
      final res = await http.post(url, body: {'list': jsonEncode(data)});

      if (res.statusCode == 200) {
        debugPrint(res.body);
      } else {
        debugPrint('Failed');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
