import 'package:get/state_manager.dart';
import 'package:product_gallery/models/product_model.dart';
import 'package:product_gallery/utils/api_manager.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  ProductModel? productModel;
  Rx<List<Product>> searchedProducts = Rx<List<Product>>([]);

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1), () async {
      getAllProducts();
    });
    super.onInit();
    if (productModel != null) {
      searchedProducts.value = productModel!.products;
    }
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

  void searchProduct(String productTitle) {
    List<Product> results = [];
    if (productTitle.isEmpty) {
      results = productModel!.products;
    } else {
      results = productModel!.products
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(productTitle.toLowerCase()))
          .toList();
    }
    searchedProducts.value = results;
  }
}
