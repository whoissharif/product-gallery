import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_gallery/controllers/product_controller.dart';
import 'package:product_gallery/models/product_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Obx(
        () {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Product> products = productController.productModel.products;
            return AlignedGridView.count(
              crossAxisCount: 2,
              itemCount: products.length,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    products[index].thumbnail,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
