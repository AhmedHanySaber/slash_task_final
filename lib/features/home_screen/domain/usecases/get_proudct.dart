

import '../../data/models/proudct_model.dart';
import '../repositories/proudct_repository.dart';

class GetProductList {
  final ProductRepository repository;

  GetProductList(this.repository);

  Future<ProductList> call() async {
    return await repository.getProductList();
  }
}
