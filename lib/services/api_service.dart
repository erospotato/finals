import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  ApiService._();

  static const String _baseUrl = 'https://fakestoreapi.com';

  static Future<List<Product>> fetchAll() async {
    final uri = Uri.parse('$_baseUrl/products');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body) as List;
      return data
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
        'Failed to fetch products. Status: ${response.statusCode}',
      );
    }
  }

  static Future<List<Product>> fetchByCategory(String category) async {
    final uri = Uri.parse('$_baseUrl/products/category/$category');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body) as List;
      return data
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
        'Failed to fetch category "$category". Status: ${response.statusCode}',
      );
    }
  }

  static Future<Product> fetchById(int id) async {
    final uri = Uri.parse('$_baseUrl/products/$id');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return Product.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception(
        'Failed to fetch product $id. Status: ${response.statusCode}',
      );
    }
  }

  static Future<List<String>> fetchCategories() async {
    final uri = Uri.parse('$_baseUrl/products/categories');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body) as List;
      return data.cast<String>();
    } else {
      throw Exception(
        'Failed to fetch categories. Status: ${response.statusCode}',
      );
    }
  }
}
