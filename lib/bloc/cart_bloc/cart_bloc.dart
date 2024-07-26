import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_app/models/sushi_model.dart';

import '../../models/cart_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartsState> {
  CartBloc() : super(CartsState()) {
    on<AddProductToCart>(_onAddProductToCart);
    on<RemoveProductToCart>(_onRemoveProductFromCart);
    on<IncreaseProductQuantity>(_onIncreaseProductQuantity);
    on<DecreaseProductQuantity>(_onDecreaseProductQuantity);
  }

  void _onAddProductToCart(AddProductToCart event, Emitter<CartsState> emit) {
    final Map<String, CartModel> cartItems = {};
    cartItems.addAll(state.cartItems);
    if (event.quantity > 0) {
      cartItems.putIfAbsent(
          event.product.id,
          () => CartModel(
                id: event.product.id,
                name: event.product.name,
                quantity: event.quantity,
                price: event.product.price,
                image: event.product.image,
                isExist: true,
                product: event.product,
              ));
      emit(CartsState(cartItems: cartItems));
    } else {
      print('product out of stock');
    }
  }

  void _onRemoveProductFromCart(
      RemoveProductToCart event, Emitter<CartsState> emit) {
    state.cartItems.clear();
    emit(CartsState(cartItems: state.cartItems));
  }

  void _onIncreaseProductQuantity(
      IncreaseProductQuantity event, Emitter<CartsState> emit) {
    if (state.cartItems.containsKey(event.product.id)) {
      state.cartItems.update(
        event.product.id,
        (value) => CartModel(
          id: value.id,
          name: value.name,
          quantity: value.quantity + event.quantity,
          price: value.price,
          image: value.image,
          isExist: true,
          product: value.product,
        ),
      );
      emit(CartsState(cartItems: state.cartItems));
    }
  }

  void _onDecreaseProductQuantity(
      DecreaseProductQuantity event, Emitter<CartsState> emit) {
    num totalQuantity = 0;
    if (state.cartItems.containsKey(event.product.id)) {
      state.cartItems.update(event.product.id, (value) {
        totalQuantity = value.quantity + event.quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          quantity: value.quantity + event.quantity,
          price: value.price,
          image: value.image,
          isExist: true,
          product: value.product,
        );
      });
      // if product quantity == 0 remove
      if (totalQuantity <= 0) {
        state.cartItems.remove(event.product.id);
      }
      emit(CartsState(cartItems: state.cartItems));
    }
  }
}
