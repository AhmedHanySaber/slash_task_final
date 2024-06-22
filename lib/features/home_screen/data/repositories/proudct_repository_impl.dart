

import '../../domain/repositories/proudct_repository.dart';
import '../data_sourse/proudct_local_data_source.dart';
import '../models/proudct_model.dart';
class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl(this.localDataSource);

  @override
  Future<ProductList> getProductList() async {
    final productListModel = await localDataSource.getProductListFromJson();
    return ProductList(
      bestSelling: productListModel.bestSelling
          .map((product) => Product(
        id: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
      ))
          .toList(),
      newArrival: productListModel.newArrival
          .map((product) => Product(
        id: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
      ))
          .toList(),
      recommendedForYou: productListModel.recommendedForYou
          .map((product) => Product(
        id: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
      ))
          .toList(),
    );
  }
}
