import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_gallery/views/widgets/product_item.dart';

import '../../controllers/product_controller.dart';

class ShopScreen extends StatelessWidget {
  ShopScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Obx(
        () {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
                itemCount: productController.productModel!.products.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                      product: productController.productModel!.products[index]);
                });
          }
        },
      ),
    );
  }
}
