import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import '/controllers/cart_controller.dart';
import 'menu.dart';

class Header extends StatelessWidget {
  Header({
    Key? key,
  }) : super(key: key);

  final _cartController = Get.find<CartCrontroller>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 70,
        right: 70,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //BT cart
          InkWell(
            onTap: () {
              Get.toNamed('/');
            },
            child: SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(
                'assets/icone/Icon.png',
                scale: 1.0,
              ),
            ),
          ),
          const HeaderWebMenu(),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _showCart(context),
              );
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: ColorsTheme.pinkColor,
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AlertDialog _showCart(context) {
    return AlertDialog(
      title: const Text('Carrinho de compras'),
      actions: [
        OutlinedButton(
          onPressed: () async => _cartController.cart.isEmpty
              ? _cartController.cartEmpity()
              : _cartController.haveProducts(),
          child: const Text('Finalizar compra'),
        ),
        TextButton(
          child: const Text("Voltar"),
          onPressed: () => Get.back(),
        )
      ],
      content: Obx(
        () => Padding(
          padding: const EdgeInsets.all(8.0),
          child: _cartController.cart.isEmpty
              ? const SizedBox(
                  width: 150,
                  height: 150,
                  child: Center(
                    child: Text('Carrinho vazio!'),
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: ListView.builder(
                          itemCount: _cartController.cart.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  //Cart. 'Name and Price add'.
                                  Text(_cartController.cart[index].name),
                                  Text(_cartController.cart[index].price),

                                  //Delete item
                                  IconButton(
                                    onPressed: () => _cartController
                                        .remove(_cartController.cart[index]),
                                    icon: const Icon(Icons.delete),
                                  )
                                ],
                              ),
                              const Divider(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
