import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text.dart';
import '../core/utils/app_values.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.totalPrice,
    required this.onPlaceOrder,
  });
  final num totalPrice;
  final Function() onPlaceOrder;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.kDefault),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16),topRight: Radius.circular(16))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.large('\$$totalPrice', fontSize: 20,fontWeight: FontWeight.w900),
              AppText.small('total price',color: AppColors.btnColor,fontWeight: FontWeight.w600),
            ],
          )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                  backgroundColor: AppColors.btnColor
              ),
              onPressed: onPlaceOrder, child: AppText.medium('Place Order',color: AppColors.white))
        ],
      ),
    );
  }
}