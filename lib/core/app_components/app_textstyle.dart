import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/app_components/app_colors.dart';

class ApptextStyle {
  static TextStyle f15w400grey30 = TextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.grey1.withOpacity(0.30));

  static TextStyle f16w600b87 = TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.black.withOpacity(0.87));

  static TextStyle f14w600w = TextStyle(
      fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.white);
}
