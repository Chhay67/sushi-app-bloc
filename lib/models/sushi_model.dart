class SushiModel {
  SushiModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.rating,
    required this.image,
  });

  final String id;
  final String name;
  final num quantity;
  final num price;
  final num rating;
  final String image;

  factory SushiModel.fromJson(Map<String, dynamic> json){
    return SushiModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      quantity: json["quantity"] ?? 0,
      price: json["price"] ?? 0,
      rating: json["rating"] ?? 0,
      image: json['image'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "quantity": quantity,
    "price": price,
    "rating": rating,
    "image" : image,
  };

}
