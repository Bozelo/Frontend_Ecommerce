import 'package:e_frontend/models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsService {
  Future<List<Product>> getProducts(String uri, String provider) async {
    final response = await http.get(Uri.parse(uri));
    final list = List<Map<String, dynamic>>.from(json.decode(response.body));
    return list.map((doc) => Product.fromJson(doc, provider)).toList();
  }

  Future<Product> getDetail(String provider, String id) async {
    //Mock API.
    final uri =
        'https://616d6bdb6dacbb001794ca17.mockapi.io/devnology/$provider/$id';
    final response = await http.get(Uri.parse(uri));
    final product = Product.fromJson(json.decode(response.body), provider);
    return product;
  }
}
