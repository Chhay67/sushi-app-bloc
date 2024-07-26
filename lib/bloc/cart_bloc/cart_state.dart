part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartsState extends CartState {
  final Map<String, CartModel> cartItems;
  CartsState({this.cartItems = const {}});

  List<CartModel> get getItems {
    return cartItems.entries.map((e) {
      return e.value;
    }).toList();
  }

  double get totalAmount {
    double total = 0;
    cartItems.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }
}
