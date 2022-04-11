import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';
import 'package:product_gallery/models/coin_desk.dart';
import 'package:product_gallery/utils/coin_desk_manager.dart';

class CoinController extends GetxController {
  var isLoading = true.obs;
  CoinDeskModel? coinDeskModel;
  var highest = 0.0.obs;
  var date = ''.obs;

  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  void onInit() {
    getCoinData();

    super.onInit();
  }

  getMaxValue() {
    for (var key in coinDeskModel!.bpi.keys) {
      if (highest < coinDeskModel!.bpi[key]!) {
        highest(coinDeskModel!.bpi[key]);
        date(key);
      }
    }
  }

  void getCoinData() async {
    final String endDate = formatter.format(now);
    final String startDate =
        formatter.format(DateTime(now.year, now.month - 1, now.day));
    try {
      isLoading(true);
      var data = await CoinDeskManager.fetchCoinData(startDate, endDate);
      if (data != null) {
        coinDeskModel = data;
      }
      getMaxValue();
    } finally {
      isLoading(false);
    }
  }
}
