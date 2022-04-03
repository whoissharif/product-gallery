import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_gallery/controllers/product_controller.dart';
import 'package:product_gallery/models/product_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/product_dialog.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Obx(
        () {
          if (productController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<Product> products = productController.productModel.products;
            return GridView.custom(
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: [
                  const QuiltedGridTile(2, 2),
                  const QuiltedGridTile(1, 1),
                  const QuiltedGridTile(1, 1),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) => InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return ProductDialog(product: products[index]);
                      },
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      products[index].thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                childCount: products.length,
              ),
            );
          }
        },
      ),
    );
  }
}
