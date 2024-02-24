// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/core/app_components/app_colors.dart';
import 'package:task/providers/string/string_interface.dart';
import 'package:task/providers/string/string_viewmodel.dart';

class StringProvider extends ChangeNotifier implements StringInterface {
  late StringViewmodel viewmodel;
  String capitalCase = "",
      lowerCase = "",
      titleCase = "",
      characterOccured = "";
  int frequency = 0;

  StringProvider() {
    viewmodel = StringViewmodel(this);
  }

  @override
  void onConvertedToCapitalCase(String capitalCase) {
    this.capitalCase = capitalCase;
    notifyListeners();
  }

  @override
  void onConvertedToLowerCase(String lowerCase) {
    this.lowerCase = lowerCase;
    notifyListeners();
  }

  @override
  void onConvertedToTitleCase(String titleCase) {
    this.titleCase = titleCase;
    notifyListeners();
  }

  @override
  void onCountFrequency(String input, int frequency) {
    this.frequency = frequency;
    characterOccured = input;
    notifyListeners();
  }

  @override
  void onFailed(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.CENTER,
        backgroundColor: AppColors.primary,
        textColor: AppColors.white);
  }

  @override
  void dispose() {}
}
