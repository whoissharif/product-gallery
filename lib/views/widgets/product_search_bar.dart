import 'package:flutter/material.dart';

import '../../controllers/product_controller.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({
    Key? key,
    required this.productController,
  }) : super(key: key);

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, bottom: 10),
      child: TextField(
        onChanged: (value) => productController.searchProduct(value),
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          hintText: 'Search in Swepexyz..',
          hintStyle: const TextStyle(color: Color.fromARGB(255, 121, 120, 120)),
          contentPadding: const EdgeInsets.all(10),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          fillColor: const Color.fromARGB(255, 218, 223, 228),
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
