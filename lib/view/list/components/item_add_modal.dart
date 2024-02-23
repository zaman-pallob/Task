import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/app_components/app_colors.dart';
import 'package:task/core/app_components/app_string.dart';
import 'package:task/core/app_components/app_textstyle.dart';
import 'package:task/core/common_widgets/edittext.dart';
import 'package:task/core/utils/time_formatter.dart';
import 'package:task/models/items.dart';
import 'package:task/providers/list/list_provider.dart';

void itemAddModal(BuildContext context, ListProvider provider) {
  Future<void> future = showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.secondary,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
            topLeft: Radius.circular(24.r), topRight: Radius.circular(24.r))),
    builder: (BuildContext _context) {
      return CupertinoPageScaffold(
        resizeToAvoidBottomInset: true,
        child: Container(
          height: 500.h,
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
          decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r))),
          child: ListView(
            children: [
              EditText(
                hints: AppString.nameHints,
                onComplete: (String v) {
                  provider.viewModel.isValidName();
                },
                stream: provider.viewModel.nameStream,
                controller: provider.viewModel.nameController,
                inputType: TextInputType.name,
                inputAction: TextInputAction.next,
                title: AppString.name,
              ),
              SizedBox(height: 10.h),
              EditText(
                hints: AppString.ageHints,
                onComplete: (String v) {
                  provider.viewModel.isAgeValid();
                },
                stream: provider.viewModel.ageStream,
                controller: provider.viewModel.ageController,
                inputType: TextInputType.number,
                inputAction: TextInputAction.next,
                title: AppString.age,
              ),
              SizedBox(height: 10.h),
              EditText(
                hints: AppString.phoneHints,
                onComplete: (String v) {
                  provider.viewModel.isPhoneValid();
                },
                stream: provider.viewModel.phoneStream,
                controller: provider.viewModel.phoneController,
                inputType: TextInputType.phone,
                inputAction: TextInputAction.next,
                title: AppString.phone,
              ),
              SizedBox(height: 30.h),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(double.infinity, 50.h),
                      backgroundColor: AppColors.primary),
                  onPressed: () {
                    var ob = provider.viewModel;
                    if (ob.isValidName() &&
                        ob.isAgeValid() &&
                        ob.isPhoneValid()) {
                      provider.addData(TodoItem(
                          id: Timeformatter.getId(),
                          name: ob.nameController.text,
                          age: int.parse(ob.ageController.text),
                          numbers: ob.phoneController.text));
                      Navigator.pop(context);
                    }
                  },
                  child: Text(AppString.add, style: ApptextStyle.f14w600w))
            ],
          ),
        ),
      );
    },
  );
  future.then((void value) {});
}
