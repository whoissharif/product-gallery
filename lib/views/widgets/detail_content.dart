import 'package:flutter/material.dart';
import 'package:product_gallery/constants/string_constants.dart';

import '../../constants/style_constants.dart';
import '../../models/product_model.dart';

class DetailContent extends StatelessWidget {
  const DetailContent({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.category, style: kCategoryTextStyle),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                    ),
                    Text(
                      '(${product.rating.toString()})',
                      style: kRatingTextStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
          Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              Flexible(
                child: SizedBox(
                  child: Text(
                    product.title,
                    style: kProductTitleTextStyle,
                  ),
                ),
              ),
              Row(
                children: [
                  Text('\$${product.price.toString()}',
                      style: kProductPriceTextStyle),
                  Text(
                    ' (${product.discountPercentage.toString()}% Off)',
                    style: kRatingTextStyle,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Brand: ',
                style: kCategoryTextStyle,
              ),
              Text(
                product.brand,
                style: kRatingTextStyle,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                  width: 250,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 210, 218, 223),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(StringConstants.inStock),
                      const Spacer(),
                      Text(
                        product.stock.toString(),
                        style: kStcokTextStyle,
                      )
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            product.description,
            style: kDescriptionTextStyle,
          )
        ],
      ),
    );
  }
}
