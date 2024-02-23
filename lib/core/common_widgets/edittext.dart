// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/app_components/app_textstyle.dart';

import '../app_components/app_colors.dart';

class EditText extends StatefulWidget {
  String hints;
  Function onComplete;
  Stream<String> stream;
  TextInputType inputType;
  TextInputAction inputAction;
  TextEditingController controller;
  String title;
  EditText({
    required this.hints,
    required this.onComplete,
    required this.stream,
    required this.controller,
    required this.inputType,
    required this.inputAction,
    required this.title,
  });

  @override
  State<EditText> createState() => _EditTextState();
}

class _EditTextState extends State<EditText> {
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: widget.stream,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.title,
                    style: ApptextStyle.f16w600b87,
                  )),
              SizedBox(height: 10.h),
              Container(
                height: 50.h,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
                child: TextField(
                  textInputAction: widget.inputAction,
                  controller: widget.controller,
                  onSubmitted: (value) {
                    widget.onComplete(value);
                  },
                  keyboardType: widget.inputType,
                  decoration: InputDecoration(
                      hintStyle: ApptextStyle.f15w400grey30,
                      suffixStyle:
                          TextStyle(color: Colors.grey[600]!.withOpacity(.9)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: hasData(snapshot.data)
                                ? AppColors.lightred
                                : Colors.grey[600]!.withOpacity(.9),
                            width: 1.w),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primary, width: 1.w),
                          borderRadius: BorderRadius.circular(8.r)),
                      hintText: widget.hints),
                ),
              ),
              hasData(snapshot.data)
                  ? Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 15.w),
                      alignment: Alignment.centerLeft,
                      child: Text(snapshot.data.toString(),
                          style: TextStyle(color: AppColors.lightred)),
                    )
                  : Container()
            ],
          );
        });
  }

  bool hasData(String? data) {
    if (data == null) {
      return false;
    } else {
      if (data == "") {
        return false;
      } else {
        return true;
      }
    }
  }
}
