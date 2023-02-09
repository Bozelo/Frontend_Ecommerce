import '/models/product.dart';
import '/services/products_service.dart';

class ProductDetailController {
  final service = ProductsService();

  Future<Product> getProductDetail(String provider, String id) async {
    return await service.getDetail(provider, id);
  }
}
