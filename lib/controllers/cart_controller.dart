import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/models/product.dart';
import '../../../services/api.dart';

class CartCrontroller {
  final cart = RxList<Product>();
  final api = Api();

  void add(Product product) {
    cart.add(product);
  }

  void remove(Product product) {
    cart.removeWhere((element) =>
        element.id == product.id && element.provider == product.provider);
  }

  void clear() {
    cart.clear();
  }

  void cartEmpity() {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        content: Text("Carrinho está vazio, adicione produtos!"),
      ),
    );
    Get.back();
  }

  void haveProducts() async {
    await api.addProduct(cart);
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        content: Text("Compra finalizada com sucesso!"),
      ),
    );
    Get.toNamed('/');
    clear();
  }
}
