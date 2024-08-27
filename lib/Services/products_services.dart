import 'dart:convert';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:http/http.dart' as http; // Fixed import for http package

class NetworkProvider {
  // Method to handle GET requests
  static Future<http.Response> getRequest(String url, [Map<String, String>? headers]) async {
    try {
      final response = await http.get(Uri.parse(url), headers: headers ?? {});
      return response;
    } catch (e) {
      throw Exception("Network error: ${e.toString()}"); // Handle network errors
    }
  }
}

class ProductRepository {
  // Fetch products from the API
  Future<List<Product>> getProduct() async {
    final url = "https://dummyjson.com/products/category/mens-shoes";
    final response = await NetworkProvider.getRequest(url);

    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        final productsModel = ProductsModel.fromJson(jsonData);
        return productsModel.products;
      } catch (e) {
        throw Exception("Error parsing product data: ${e.toString()}"); // Handle JSON parsing errors
      }
    } else {
      throw Exception("Error loading products: ${response.statusCode}"); // Handle non-200 status codes
    }
  }
}
