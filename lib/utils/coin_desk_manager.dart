import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:product_gallery/constants/urls.dart';
import 'package:product_gallery/models/coin_desk.dart';

class CoinDeskManager {
  static var client = http.Client();

  static Future<CoinDeskModel?> fetchCoinData(
      String startDate, String endDate) async {
    try {
      var response = await client.get(Uri.parse(
          Urls.coinDeskUrl + 'start=$startDate&end=$endDate&currency=eur'));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return coinDeskModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
