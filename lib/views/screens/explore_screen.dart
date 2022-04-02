import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_gallery/controllers/product_controller.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: productController.productModel.products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(productController.productModel.products[index].title
                    .toString()),
              );
            },
          );
        }
      },
    );
  }
}
