import 'package:flutter/material.dart';
import 'package:product_gallery/constants/string_constants.dart';

class ProductDetailBottomSheet extends StatelessWidget {
  const ProductDetailBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            margin: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 10,
            ),
            child: const Icon(
              Icons.bookmark_outline,
            ),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 214, 218, 219),
                borderRadius: BorderRadius.circular(15)),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            margin: const EdgeInsets.only(
              bottom: 20,
              right: 20,
            ),
            child: const Text(
              StringConstants.addToCart,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ],
    );
  }
}
