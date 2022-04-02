import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:product_gallery/constants/urls.dart';
import 'package:product_gallery/models/product_model.dart';

class ApiManager {
  static var client = http.Client();

  static Future<ProductModel?> fetchProducts() async {
    try {
      var response = await client.get(Uri.parse(Urls.productList));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return productModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
