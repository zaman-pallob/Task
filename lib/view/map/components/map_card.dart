// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_components/app_colors.dart';

class MapCard extends StatelessWidget {
  String name;
  String age;
  Function onEdit;
  MapCard({required this.name, required this.age, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Card(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            color: AppColors.primary, fontSize: 16.sp),
                      ),
                      Icon(Icons.arrow_forward),
                      Text(
                        age,
                        style: TextStyle(
                            color: AppColors.primary, fontSize: 16.sp),
                      )
                    ],
                  )),
              InkWell(
                onTap: () {
                  onEdit();
                },
                child: Container(
                  width: 35.w,
                  height: 35.h,
                  child:
                      Icon(Icons.edit, size: 30.h, color: AppColors.lightred),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
