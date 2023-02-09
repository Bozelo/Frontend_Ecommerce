import 'package:get/get.dart';
import '/models/product.dart';

class CartCrontroller {
  final cart = RxList<Product>();

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
}
