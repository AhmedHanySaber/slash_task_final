class ProductModel {
  final int id;
  final String name;
  final double price;
  final String image;

  ProductModel({required this.id, required this.name, required this.price, required this.image});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }
}

class ProductListModel {
  final List<ProductModel> bestSelling;
  final List<ProductModel> newArrival;
  final List<ProductModel> recommendedForYou;

  ProductListModel({required this.bestSelling, required this.newArrival, required this.recommendedForYou});

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    var bestSellingList = json['bestSelling'] as List;
    var newArrivalList = json['newArrival'] as List;
    var recommendedForYouList = json['recommendedForYou'] as List;

    List<ProductModel> bestSelling = bestSellingList.map((i) => ProductModel.fromJson(i)).toList();
    List<ProductModel> newArrival = newArrivalList.map((i) => ProductModel.fromJson(i)).toList();
    List<ProductModel> recommendedForYou = recommendedForYouList.map((i) => ProductModel.fromJson(i)).toList();

    return ProductListModel(
      bestSelling: bestSelling,
      newArrival: newArrival,
      recommendedForYou: recommendedForYou,
    );
  }
}
