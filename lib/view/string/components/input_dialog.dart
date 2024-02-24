import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/global_variable.dart';

class InputDialog {
  static void show(Function(String) onSubmit) {
    showDialog(
      context: GlobalVariable.context,
      builder: (context) {
        return Dialog(
          child: Container(
              height: 100.h,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              child: TextFormField(
                onChanged: (value) {
                  if (value.length == 1) {
                    onSubmit(value);
                  } else {
                    onSubmit(value[0]);
                  }
                  Navigator.pop(context);
                },
              )),
        );
      },
    );
  }
}
