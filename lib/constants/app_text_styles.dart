import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const heading2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const heading3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const bodyMedium = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const bodySmall = TextStyle(
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  static const hint = TextStyle(fontSize: 14, color: AppColors.textHint);

  static const priceLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const priceLarge = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const chipLabel = TextStyle(
    color: AppColors.primary,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
  );
}
