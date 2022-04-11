import 'package:get/state_manager.dart';
import 'package:product_gallery/models/coin_desk.dart';
import 'package:product_gallery/utils/coin_desk_manager.dart';

class CoinController extends GetxController {
  var isLoading = true.obs;
  CoinDeskModel? coinDeskModel;
  var highest = 0.0.obs;
  var date = ''.obs;

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
    try {
      isLoading(true);
      var data = await CoinDeskManager.fetchCoinData();
      if (data != null) {
        coinDeskModel = data;
      }
      getMaxValue();
    } finally {
      isLoading(false);
    }
  }
}
