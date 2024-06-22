class Product {
  final int id;
  final String name;
  final double price;
  final String image;

  Product({required this.id, required this.name, required this.price, required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
    );
  }
}

class ProductList {
  final List<Product> bestSelling;
  final List<Product> newArrival;
  final List<Product> recommendedForYou;

  ProductList({required this.bestSelling, required this.newArrival, required this.recommendedForYou});

  factory ProductList.fromJson(Map<String, dynamic> json) {
    var bestSellingList = json['bestSelling'] as List;
    var newArrivalList = json['newArrival'] as List;
    var recommendedForYouList = json['recommendedForYou'] as List;

    List<Product> bestSelling = bestSellingList.map((i) => Product.fromJson(i)).toList();
    List<Product> newArrival = newArrivalList.map((i) => Product.fromJson(i)).toList();
    List<Product> recommendedForYou = recommendedForYouList.map((i) => Product.fromJson(i)).toList();

    return ProductList(
      bestSelling: bestSelling,
      newArrival: newArrival,
      recommendedForYou: recommendedForYou,
    );
  }
}
