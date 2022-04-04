import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../models/product_model.dart';

class ProductSlider extends StatelessWidget {
  const ProductSlider({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: product.images
          .map(
            (e) => CachedNetworkImage(
              imageUrl: e,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          )
          .toList(),
      options: CarouselOptions(
        viewportFraction: .5,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.24,
      ),
    );
  }
}
