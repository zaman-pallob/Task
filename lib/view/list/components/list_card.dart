// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_components/app_colors.dart';

class ListCard extends StatelessWidget {
  String name;
  int age;
  String phone;
  Function onDelete;
  ListCard({
    required this.name,
    required this.age,
    required this.phone,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: Card(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(name),
                    textWidget("Age: $age"),
                    textWidget("Phone: $phone")
                  ],
                ),
              ),
              Container(
                width: 35.w,
                height: 35.h,
                child: Icon(Icons.delete_forever_outlined,
                    size: 30.h, color: AppColors.lightred),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textWidget(String title) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(color: AppColors.primary, fontSize: 16.sp),
    );
  }
}
