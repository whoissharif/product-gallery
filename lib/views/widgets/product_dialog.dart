import 'package:flutter/material.dart';
import '../../models/product_model.dart';

class ProductDialog extends StatelessWidget {
  const ProductDialog({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      content: Builder(builder: (context) {
        var width = MediaQuery.of(context).size.width;

        return SizedBox(
          width: width - 50,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.thumbnail,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(product.title),
                subtitle: Text(product.brand),
                trailing: Container(
                  width: width / 3.6,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 236, 236, 236),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.person_add,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Follow',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      product.thumbnail,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 236, 236, 236),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text(
                    'View Post',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
