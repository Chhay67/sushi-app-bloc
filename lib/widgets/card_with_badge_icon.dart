import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text.dart';

class CartWithBadgeIcon extends StatelessWidget {
  const CartWithBadgeIcon({
    super.key,
    this.items = 0,
    required this.onTap,
  });
  final int items;
  final Function() onTap;

  String getValidBadge(int items) {
    if (items < 9) {
      return items.toString();
    }
    return '9+';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed:  onTap, icon: const Icon(Icons.shopping_cart_outlined)),
        if (items > 0)
          Positioned(
              right: 4,
              top: 0,
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: AppText.small(getValidBadge(items),fontWeight: FontWeight.bold, color: AppColors.white),
              ))
      ],
    );
  }
}

