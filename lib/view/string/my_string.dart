// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/core/app_components/app_colors.dart';
import 'package:task/core/app_components/app_string.dart';
import 'package:task/core/app_components/app_textstyle.dart';
import 'package:task/core/common_widgets/description_box.dart';
import 'package:task/providers/string/string_provider.dart';
import 'package:task/view/string/components/input_dialog.dart';

class MyString extends StatelessWidget {
  late StringProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<StringProvider>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              DescriptionBox(
                onSubmit: (String v) {
                  provider.viewmodel.setMystring(v);
                },
              ),
              SizedBox(height: 10.h),
              buttons(),
              SizedBox(height: 50.h),
              lowercaseWidget(),
              SizedBox(height: 10.h),
              upperCaseWidget(),
              SizedBox(height: 10.h),
              titleCaseWidget(),
              SizedBox(height: 10.h),
              frequencyWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget lowercaseWidget() {
    return Consumer<StringProvider>(
      builder: (context, provider, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration:
            BoxDecoration(border: Border.all(color: AppColors.ash, width: 1.w)),
        child: Text(
          provider.lowerCase,
          style: ApptextStyle.f16w600b87,
        ),
      ),
    );
  }

  Widget upperCaseWidget() {
    return Consumer<StringProvider>(
        builder: (context, provider, child) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.ash, width: 1.w)),
              child: Text(
                provider.capitalCase,
                style: ApptextStyle.f16w600b87,
              ),
            ));
  }

  Widget titleCaseWidget() {
    return Consumer<StringProvider>(
        builder: (context, provider, child) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.ash, width: 1.w)),
              child: Text(
                provider.titleCase,
                style: ApptextStyle.f16w600b87,
              ),
            ));
  }

  Widget frequencyWidget() {
    return Consumer<StringProvider>(
        builder: (context, provider, child) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.ash, width: 1.w)),
              child: Text(
                "'${provider.characterOccured}'  ${provider.frequency} times  ",
                style: ApptextStyle.f16w600b87,
              ),
            ));
  }

  Widget buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              provider.viewmodel.toLowerCase(provider.viewmodel.mystring);
            },
            child: Text(AppString.lower, style: ApptextStyle.f14w600w)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              provider.viewmodel.toUpperCase(provider.viewmodel.mystring);
            },
            child: Text(AppString.upper, style: ApptextStyle.f14w600w)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              provider.viewmodel.toTitleCase(provider.viewmodel.mystring);
            },
            child: Text(AppString.title, style: ApptextStyle.f14w600w)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            onPressed: () {
              InputDialog.show((String target) {
                provider.viewmodel.getFrequency(
                    provider.viewmodel.mystring.toLowerCase(),
                    target.toLowerCase());
              });
            },
            child: Text(AppString.frequency, style: ApptextStyle.f14w600w)),
      ],
    );
  }
}
