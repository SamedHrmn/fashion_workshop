import 'dart:convert';

import 'package:http/http.dart' as http;

class FashionService {
  static const String _fashionProducts = 'https://fakestoreapi.com/products';

  Future<List<dynamic>?> getProducts() async {
    final response = await http.get(Uri.parse(_fashionProducts));
    if (response.body.isNotEmpty) {
      return json.decode(response.body);
    }
    return null;
  }
}
