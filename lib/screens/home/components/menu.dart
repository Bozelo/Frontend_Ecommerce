import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderWebMenu extends StatelessWidget {
  const HeaderWebMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderMenu(tittle: 'Home', press: () => Get.toNamed('/')),
        HeaderMenu(tittle: 'Produtos', press: () => Get.toNamed('/products')),
      ],
    );
  }
}

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    Key? key,
    required this.tittle,
    required this.press,
  }) : super(key: key);

  final String tittle;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: press,
        child: Text(
          tittle,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
