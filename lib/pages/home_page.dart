import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:sushi_app/core/utils/app_values.dart';
import '../bloc/product_bloc/product_bloc.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text.dart';
import '../widgets/card_with_badge_icon.dart';
import '../widgets/product_section.dart';
import '../widgets/welcome_section.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ProductBloc>().add(GetProductsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
        appBar: AppBar(
          title: AppText.large('Sushi Restaurant'),
          centerTitle: true,
          actions: [
            BlocBuilder<CartBloc, CartsState>(builder: (context, state) {
              print('CartWithBadgeIcon');
              return CartWithBadgeIcon(
                items: state.getItems.length,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CartPage()));
                },
              );
            }),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppPadding.kDefault),
            child: Column(
              children: [
                const WelcomeSection(
                  title:
                      'Welcome to Sushi food, find your sushi you like the most.',
                ),
                BlocConsumer<ProductBloc, ProductState>(
                  listener: (context, state) {
                    if (state is ProductFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              AppText.small(state.errorMessage.toString())));
                    }
                  },
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.white,
                        ),
                      );
                    }
                    if (state is ProductSuccess) {
                      return ProductSection(
                        sushiProduct: state.products,
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
