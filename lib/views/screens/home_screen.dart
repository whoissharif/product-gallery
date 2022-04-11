import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_gallery/controllers/coin_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final CoinController coinController = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Obx(
        () {
          if (coinController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${coinController.date} : '),
                  Text('${coinController.highest}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
