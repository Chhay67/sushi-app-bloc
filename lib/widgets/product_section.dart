import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sushi_app/widgets/product_item_card.dart';
import '../bloc/cart_bloc/cart_bloc.dart';
import '../core/theme/app_text.dart';
import '../core/utils/app_values.dart';
import '../models/sushi_model.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key, this.sushiProduct = const []});
  final List<SushiModel> sushiProduct;
  @override
  Widget build(BuildContext context) {
    print('rebuild product');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Product title
        AppText.large('Popular sushi'),
        /// Render product card
        GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: AppPadding.kDefault),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sushiProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1 / 1.2,
          ),
          itemBuilder: (context, index) {
            final sushi = sushiProduct[index];
            return ProductItemCard(
              imageUrl: sushi.image,
              name: sushi.name,
              price: sushi.price,
              rating: sushi.rating,
              onTap: () {
                context.read<CartBloc>().add(AddProductToCart(product: sushi, quantity: 1));
              },
            );
          },
        ),
      ],
    );
  }
}
