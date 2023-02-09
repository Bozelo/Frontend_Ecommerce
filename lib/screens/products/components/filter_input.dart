import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/products_controller.dart';
import '../../constants.dart';

class FilterInput extends StatelessWidget {
  FilterInput({
    Key? key,
  }) : super(key: key);

  final _productsController = Get.find<ProductsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFE8E8E8),
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: Center(
          child: TextFormField(
            style: const TextStyle(color: ColorsTheme.textColor),
            onChanged: (value) {
              _productsController.filterData(value);
            },
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: ColorsTheme.textColor,
              ),
              hintText: "Pesquisar",
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 16,
                  color: ColorsTheme.pinkColor),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }
}
