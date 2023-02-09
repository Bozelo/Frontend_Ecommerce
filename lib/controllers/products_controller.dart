import '/models/product.dart';
import '/services/products_service.dart';
import 'package:get/get.dart';

class ProductsController {
  final service = ProductsService();

  final data = RxList<Product>();
  final filterdData = RxList<Product>();

  void filterData(final String filter) {
    final list = data
        .where(
          (product) =>
              product.name.toUpperCase().contains(filter.toUpperCase()),
        )
        .toList();

    filterdData.assignAll(list);
  }

  Future<void> loadingProducts() async {
    final products = await service.getProducts(
      //Mock API 1
      'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider',
      'brazilian_provider',
    );

    products.addAll(
      await service.getProducts(
        //Mock API 2
        'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/european_provider',
        'european_provider',
      ),
    );

    data.clear();
    data.addAll(products);

    filterdData.addAll(products);
  }
}
