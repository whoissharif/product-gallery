import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_gallery/constants/string_constants.dart';
import 'package:product_gallery/constants/style_constants.dart';
import 'package:product_gallery/models/product_model.dart';
import 'package:product_gallery/views/screens/product_detail.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          children: [
            Stack(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (c) {
                              return ProductDetail(product: product);
                            },
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: deviceWidth * .22,
                            child: Stack(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: product.thumbnail,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: deviceWidth * .012,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: deviceWidth * .39,
                                  child: Text(
                                    product.title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: deviceHeight * .017,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  product.brand,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      ('\$${product.price.toString()}'),
                                      style: kRatingTextStyle,
                                    ),
                                    SizedBox(
                                      width: deviceWidth * .020,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Card(
                      child: Container(
                        height: deviceHeight * .04,
                        width: deviceWidth / 4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: Text(
                            StringConstants.addToCart,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: deviceWidth * .030),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 5,
                  left: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.8),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                    child: const FittedBox(
                      child: Text(
                        StringConstants.inStock,
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
