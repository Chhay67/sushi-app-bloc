import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:sushi_app/core/utils/app_values.dart';
import '../core/theme/app_text.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/cart_item_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    print('CartPage');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: AppText.large('Your cart food', fontSize: 24),
      ),
      body: BlocBuilder<CartBloc, CartsState>(builder: (context, state) {

          print('CartBloc');
          if(state.getItems.isEmpty){
            return Center(child: AppText.medium('no items'),);
          }
          return ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: state.getItems.length,
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.kDefault),
            separatorBuilder: (context, index) => const SizedBox(height: AppPadding.p10),
            itemBuilder: (context, index) {
              final item = state.getItems[index];
              return CartItemCard(
                price: item.price,
                name: item.name,
                imageUrl: item.image,
                quantity: item.quantity,
                onAdd: () {
                  context.read<CartBloc>().add(IncreaseProductQuantity(
                      product: item.product, quantity: 1));
                },
                onMinus: () {
                  context.read<CartBloc>().add(DecreaseProductQuantity(
                      product: item.product, quantity: -1));
                },
              );
            },
          );

      }),
      bottomNavigationBar: BlocBuilder<CartBloc, CartsState>(
        builder: (context, state) {
          print('build BottomBar');
          return BottomBar(
            totalPrice: state.totalAmount,
            onPlaceOrder: () {
              context.read<CartBloc>().add(RemoveProductToCart());
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: AppText.small('Place Order successfully')));
            },
          );
        },
      ),
    );
  }
}
