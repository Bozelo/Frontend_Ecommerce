import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/products_controller.dart';
import '/controllers/cart_controller.dart';
import '/screens/products/product_detail_screen.dart';
import '/screens/products/products_screen.dart';
import '/screens/home/home_screen.dart';

void main() async {
  Get.put(ProductsController());
  Get.put(CartCrontroller());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'e-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Ubuntu',
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/products',
          page: () => const ProductsScreen(),
        ),
        GetPage(
          name: '/product/:provider/:id/detail',
          page: () => ProductDetailScreen(),
        ),
      ],
    );
  }
}
