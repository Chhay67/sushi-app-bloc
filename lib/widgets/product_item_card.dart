import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text.dart';
import '../core/utils/app_values.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.rating,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.onTap,
    this.isAddToCart = false,
  });
  final String imageUrl;
  final String name;
  final num price;
  final num rating;
  final Function() onTap;
  final bool isAddToCart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p10),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24)),
      child: Stack(
        children: [
          Image.asset(
            imageUrl,
            width: double.infinity,
            height: 100,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.large(name,fontWeight: FontWeight.w500),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: AppText.large(
                        '\$$price',
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    IconButton(
                        onPressed: onTap,
                        icon: isAddToCart ? const Icon(Icons.shopping_cart) :const Icon(Icons.shopping_cart_outlined))
                  ],
                ),
              ],
            ),
          ),
          Positioned(
              right: 0,
              top: 0,
              child: Row(
                children: [
                  const Icon(Icons.star,color: Colors.orange,size: 16),
                  const SizedBox(width: 4),
                  AppText.small(rating.toString(),fontWeight: FontWeight.bold)
                ],
              ))
        ],
      ),
    );
  }
}