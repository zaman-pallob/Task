import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/app_components/app_routes.dart';
import '../app_components/app_colors.dart';
import '../utils/global_variable.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => Size(double.infinity, 100.h);
}

class _CustomAppbarState extends State<CustomAppbar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.h,
        padding: EdgeInsets.only(top: GlobalVariable.statusbarHeight),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.r),
                bottomRight: Radius.circular(8.r)),
            color: AppColors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            tabItem(
              title: "My List",
              onTap: () {
                setIndex(0);
                Navigator.pushReplacementNamed(
                    GlobalVariable.context, AppRoutes.mylist);
              },
              index: 0,
            ),
            tabItem(
              title: "My Map",
              onTap: () {
                setIndex(1);
                Navigator.pushReplacementNamed(
                    GlobalVariable.context, AppRoutes.mymap);
              },
              index: 1,
            ),
            tabItem(
              title: "My String",
              onTap: () {
                setIndex(2);
                Navigator.pushReplacementNamed(
                    GlobalVariable.context, AppRoutes.mystring);
              },
              index: 2,
            )
          ],
        ));
  }

  void setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget tabItem(
      {required String title, required Function onTap, required int index}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color:
                  index == currentIndex ? AppColors.primary : AppColors.white),
          child: Text(
            title,
            style: TextStyle(
                color:
                    index == currentIndex ? AppColors.white : AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
        ),
      ),
    );
  }
}
