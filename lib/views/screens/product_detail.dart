import 'package:flutter/material.dart';
import 'package:product_gallery/constants/string_constants.dart';
import 'package:product_gallery/models/product_model.dart';
import '../widgets/detail_content.dart';
import '../widgets/product_detail_bottom_sheet.dart';
import '../widgets/product_slider.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        title: const Text(
          StringConstants.productDetailString,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          ProductSlider(product: product),
          DetailContent(product: product),
        ],
      ),
      bottomSheet: const ProductDetailBottomSheet(),
    );
  }
}
