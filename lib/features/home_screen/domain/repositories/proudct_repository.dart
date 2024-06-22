import '../../data/models/proudct_model.dart';

abstract class ProductRepository {
  Future<ProductList> getProductList();
}
