import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/product_detail_controller.dart';
import '/controllers/cart_controller.dart';
import '/models/product.dart';
import '/screens/constants.dart';
import '/screens/home/components/header_container.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({Key? key}) : super(key: key);

  final _productDetailcontroller = ProductDetailController();
  final _cartController = Get.find<CartCrontroller>();
  final params = Get.parameters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderContainer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder(
              future: _productDetailcontroller.getProductDetail(
                  params['provider']!, params['id']!),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.hasData) {
                  final product = asyncSnapshot.data as Product;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        //Name
                        product.name,
                        style: const TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                      //Department
                      Text(
                        product.department,
                        style: const TextStyle(fontSize: 14.0),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        //Description
                        child: Text(product.description),
                      ),
                      //Price
                      Text(
                        'Price: \$${product.price}',
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w900),
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            //CartAdd
                            child: TextButton(
                              onPressed: () {
                                _cartController.add(product);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("Produto adicionado ao carrinho!"),
                                  ),
                                );
                              },
                              child: const Text(
                                'Adicionar no carrinho',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: ColorsTheme.pinkColor,
                                ),
                              ),
                            ),
                          ),
                          CachedNetworkImage(
                            width: 350,
                            imageUrl: product.image,
                            placeholder: (context, url) => const Center(
                              child: SizedBox(
                                width: 30.0,
                                child: CircularProgressIndicator(
                                  color: ColorsTheme.grayColor,
                                ),
                              ),
                            ),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          const Divider(),
                          Align(
                            alignment: Alignment.bottomRight,
                            //CartAdd
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed('/products');
                              },
                              child: const Text(
                                'Voltar',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: ColorsTheme.pinkColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }

                return const CircularProgressIndicator(
                  color: ColorsTheme.grayColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
