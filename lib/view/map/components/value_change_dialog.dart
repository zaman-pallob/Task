import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/app_components/app_string.dart';
import 'package:task/core/app_components/app_textstyle.dart';
import 'package:task/core/common_widgets/edittext.dart';
import 'package:task/core/utils/global_variable.dart';
import 'package:task/providers/map/map_provider.dart';

import '../../../core/app_components/app_colors.dart';

class ValueChangeDialog {
  static void open({required String key, required MapProvider provider}) {
    showDialog(
      context: GlobalVariable.context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            height: 250.h,
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Change Age for $key", style: ApptextStyle.f16w600b87),
                  EditText(
                      hints: AppString.ageHints,
                      onComplete: (String v) {
                        provider.viewmodel.isAgeValid();
                      },
                      stream: provider.viewmodel.ageStream,
                      controller: provider.viewmodel.ageController,
                      inputType: TextInputType.number,
                      inputAction: TextInputAction.done,
                      title: AppString.age),
                  SizedBox(height: 30.h),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(260.w, 50.h),
                          backgroundColor: AppColors.primary),
                      onPressed: () {
                        if (provider.viewmodel.isAgeValid()) {
                          provider.viewmodel.modify(key);

                          Navigator.pop(context);
                        }
                      },
                      child:
                          Text(AppString.change, style: ApptextStyle.f14w600w))
                ]),
          ),
        );
      },
    );
  }
}
