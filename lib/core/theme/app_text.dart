import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppText extends Text {
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final TextAlign? align;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final Color? decorationColor;
  final String? fontFamily;

  AppText.large(super.data,
      {super.key,
        this.maxLine,
        this.textOverflow,
        this.decoration,
        this.decorationStyle,
        this.decorationColor,
        this.color = AppColors.title,
        this.fontWeight = FontWeight.w600,
        this.fontSize = 18,
        this.fontFamily,
        this.align})
      : super(
      textAlign: align,
      maxLines: maxLine,
      overflow: textOverflow,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize,
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontFamily: fontFamily,
          overflow: textOverflow));
  AppText.medium(super.data,
      {super.key,
        this.color = AppColors.title,
        this.fontWeight = FontWeight.w400,
        this.fontSize = 14,
        this.decoration,
        this.decorationColor,
        this.decorationStyle,
        this.maxLine,
        this.textOverflow,
        this.fontFamily,
        this.align})
      : super(
      textAlign: align,
      maxLines: maxLine,
      overflow: textOverflow,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          decoration: decoration,
          decorationStyle: decorationStyle,
          decorationColor: decorationColor,
          fontFamily: fontFamily,
          fontSize: fontSize,
          overflow: textOverflow));
  AppText.small(super.data,
      {super.key,
        this.color = AppColors.subTitle,
        this.fontWeight = FontWeight.normal,
        this.maxLine,
        this.fontSize = 12,
        this.decoration,
        this.decorationColor,
        this.decorationStyle,
        this.textOverflow,
        this.fontFamily,
        this.align})
      : super(
      textAlign: align,
      maxLines: maxLine,
      overflow: textOverflow,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          decoration: decoration,
          decorationStyle: decorationStyle,
          decorationColor: decorationColor,
          fontFamily: fontFamily,
          fontSize: fontSize,
          overflow: textOverflow));
}
