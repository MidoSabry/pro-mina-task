import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_pro_mina/core/theming/colors.dart';
import 'package:task_pro_mina/core/theming/font_weight_helper.dart';

class TextStyles {
  static TextStyle font30GrayBold = TextStyle(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.gray,
  );

  static TextStyle font32GraySemiBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.gray,
  );

  static TextStyle font20GraySemiBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorsManager.gray,
  );

  static TextStyle font16HintGraySemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.hintText,
  );

  static TextStyle font18WhiteBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.white,
  );
}
