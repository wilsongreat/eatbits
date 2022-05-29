class Product {
  final String? prodId;
  final String name;
  final String description;
  final String prepTime;
  final double price;
  final String imageUrl;
  final String deliveryTime;

  Product(
      {this.prodId,
      required this.name,
      required this.description,
      required this.prepTime,
      required this.price,
      required this.imageUrl,
      required this.deliveryTime});

  Map<String, dynamic> toMap(String? id) {
    return {
      'id': id,
      'name': name,
      'description': description,
      'prepTime': prepTime,
      'price': price,
      'imageUrl': imageUrl,
      'deliveryTime': deliveryTime
    };
  }

  Product.fromMap(Map<String, dynamic> map)
      : prodId = map['id'] ?? '',
        name = map['name'] ?? '',
        description = map['description'] ?? '',
        prepTime = map['prepTime'] ?? '',
        price = map['price'] ?? 0.0,
        imageUrl = map['imageUrl'] ?? '',
        deliveryTime = map['deliveyTime'] ?? '';
}
