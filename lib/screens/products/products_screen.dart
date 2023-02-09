import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '/screens/constants.dart';
import '/controllers/products_controller.dart';
import '/models/product.dart';
import '/screens/home/components/header_container.dart';
import '/screens/products/components/filter_input.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final _productsController = Get.find<ProductsController>();

  @override
  initState() {
    _productsController.loadingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeaderContainer(),
          FilterInput(),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 10,
                children: getProductsCards(),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget productCard(final Product product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      //Details
      child: InkWell(
        onTap: () async {
          Get.toNamed('/product/${product.provider}/${product.id}/detail');
        },
        child: Container(
            width: 250,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: ColorsTheme.iceColor,
              boxShadow: const [
                BoxShadow(color: ColorsTheme.pinkColor, spreadRadius: 1),
              ],
            ),
            child: Column(
              children: [
                CachedNetworkImage(
                  width: 350,
                  //Image
                  imageUrl: product.image,
                  placeholder: (context, url) => const Center(
                    child: SizedBox(
                      width: 30.0,
                      child: CircularProgressIndicator(
                        color: ColorsTheme.grayColor,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    //Name
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    //Price
                    '\$ ${product.price}',
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  List<Widget> getProductsCards() {
    return List<Widget>.from(
      _productsController.filterdData.map(
        (element) => productCard(element),
      ),
    ).toList();
  }
}
