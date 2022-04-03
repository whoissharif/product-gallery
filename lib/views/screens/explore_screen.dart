import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_gallery/controllers/product_controller.dart';
import 'package:product_gallery/models/product_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../widgets/product_dialog.dart';
import '../widgets/product_search_bar.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Obx(
          () {
            if (productController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              List<Product> products =
                  productController.searchedProducts.value.isNotEmpty
                      ? productController.searchedProducts.value
                      : productController.productModel!.products;

              return Column(
                children: [
                  ProductSearchBar(productController: productController),
                  Expanded(
                    child: GridView.custom(
                      shrinkWrap: true,
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 3,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
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
                            child: CachedNetworkImage(
                              imageUrl: products[index].thumbnail,
                              fit: BoxFit.cover,
                              placeholder: (context, _) => Image.asset(
                                "assets/images/placeholder.jpg",
                                fit: BoxFit.cover,
                                gaplessPlayback: true,
                              ),
                              placeholderFadeInDuration: Duration.zero,
                            ),
                          ),
                        ),
                        childCount: products.length,
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
