import 'package:sushi_app/models/sushi_model.dart';

class CartModel {

  final String id;
  final String name;
  final num quantity;
  final num price;
  final String image;
  final SushiModel product;
  bool isExist;
  CartModel({
    required this.id,
    required this.price,
    required this.name,
    required this.quantity,
    required this.image,
    required this.product,
    this.isExist = false,
});
}