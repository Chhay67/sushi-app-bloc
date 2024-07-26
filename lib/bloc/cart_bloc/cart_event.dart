part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class AddProductToCart extends CartEvent {
  final int quantity;
  final SushiModel product;
  AddProductToCart({required this.product, required this.quantity});
}

final class RemoveProductToCart extends CartEvent {
  RemoveProductToCart();
}

final class IncreaseProductQuantity extends CartEvent {
  final int quantity;
  final SushiModel product;
  IncreaseProductQuantity({required this.product, required this.quantity});
}

final class DecreaseProductQuantity extends CartEvent {
  final int quantity;
  final SushiModel product;
  DecreaseProductQuantity({required this.product, required this.quantity});
}
