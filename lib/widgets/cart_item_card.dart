import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text.dart';
import '../core/utils/app_values.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.price,
    required this.name,
    required this.imageUrl,
    required this.quantity,
    required this.onAdd,
    required this.onMinus,
  });
  final String imageUrl;
  final String name;
  final num price;
  final num quantity;
  final Function() onAdd;
  final Function() onMinus;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(6), borderSide: BorderSide.none),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.kDefault, horizontal: AppPadding.kDefault),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(AppPadding.p10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: AppColors.lightGrey,
              ),
              child: Image.asset(imageUrl, fit: BoxFit.fitHeight),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: AppPadding.p10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.large(name, fontSize: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                            child: AppText.large('\$$price', fontSize: 22)),
                        Row(
                          children: [
                            InkWell(
                                borderRadius: BorderRadius.circular(6),
                                onTap: onMinus,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.remove),
                                )),
                            const SizedBox(width: 4),
                            AppText.large('$quantity'),
                            const SizedBox(width: 4),
                            InkWell(
                                borderRadius: BorderRadius.circular(6),
                                onTap: onAdd,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.add),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}