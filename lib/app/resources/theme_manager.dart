import 'package:api_mvvm/app/resources/color_manager.dart';
import 'package:api_mvvm/app/resources/font_manager.dart';
import 'package:api_mvvm/app/resources/styles_manager.dart';
import 'package:api_mvvm/app/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: AppSize.s4,
      titleTextStyle: getBoldStyle(
        fontSize: FontSize.s22,
        color: ColorManager.white,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: getSemiBoldStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSize.s16,
      ),
    ),
  );
}
