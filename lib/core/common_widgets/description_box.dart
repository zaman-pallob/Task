// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/app_components/app_textstyle.dart';

import '../app_components/app_colors.dart';

class DescriptionBox extends StatefulWidget {
  Function onSubmit;
  String? hints;
  int? minLines;
  int? maxLines;
  double? width;
  DescriptionBox(
      {required this.onSubmit,
      this.hints,
      this.maxLines,
      this.minLines,
      this.width});

  @override
  State<DescriptionBox> createState() => _DescriptionBoxState();
}

class _DescriptionBoxState extends State<DescriptionBox> {
  var node = FocusNode();
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 1,
                spreadRadius: 1,
                color: AppColors.black.withOpacity(0.05))
          ]),
      child: TextField(
        focusNode: node,
        textInputAction: TextInputAction.done,
        onChanged: (String v) {
          widget.onSubmit(controller.text);
        },
        onEditingComplete: () {
          widget.onSubmit(controller.text);
          FocusScope.of(context).unfocus();
        },
        onSubmitted: (value) {
          widget.onSubmit(controller.text);
          FocusScope.of(context).unfocus();
        },
        minLines: widget.minLines ?? 6,
        maxLines: widget.maxLines ?? 6,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
            hintStyle: ApptextStyle.f15w400grey30,
            suffixStyle: TextStyle(color: Colors.grey[600]!.withOpacity(.9)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.grey1.withOpacity(0.3), width: 1.w),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 1.w),
                borderRadius: BorderRadius.circular(10.r)),
            hintText: widget.hints ?? "Write something here..."),
        controller: controller,
      ),
    );
  }
}
