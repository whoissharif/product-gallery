import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_gallery/constants/string_constants.dart';
import 'package:product_gallery/views/screens/nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavScreen(),
    );
  }
}
