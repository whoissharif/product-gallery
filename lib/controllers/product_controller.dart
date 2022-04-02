import 'package:get/state_manager.dart';
import 'package:product_gallery/models/product_model.dart';
import 'package:product_gallery/utils/api_manager.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  late ProductModel productModel;

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  void getAllProducts() async {
    try {
      isLoading(true);
      var data = await ApiManager.fetchProducts();
      if (data != null) {
        productModel = data;
      }
    } finally {
      isLoading(false);
    }
  }
}
