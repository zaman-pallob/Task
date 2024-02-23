import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/core/app_components/app_colors.dart';
import 'package:task/core/app_components/app_string.dart';
import 'package:task/core/common_widgets/progress.dart';
import 'package:task/providers/list/list_provider.dart';
import 'package:task/view/list/components/list_card.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
      body: Consumer<ListProvider>(
          builder: (context, provider, child) => Stack(
                alignment: Alignment.center,
                children: [
                  provider.items.isNotEmpty
                      ? ListView.builder(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          itemCount: provider.items.length,
                          itemBuilder: (context, index) {
                            var ob = provider.items[index];
                            return ListCard(
                                name: ob.name,
                                age: ob.age,
                                phone: ob.numbers,
                                onDelete: () {
                                  provider.deleteData(ob.id);
                                });
                          },
                        )
                      : emptyList(provider),
                  Progress(hasProgress: provider.hasProgress)
                ],
              )),
    );
  }

  Widget emptyList(ListProvider provider) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Please add items on your list"),
        SizedBox(height: 50.h),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(150.w, 60.h),
                backgroundColor: AppColors.primary),
            onPressed: () {},
            child: Text(
              AppString.add,
              style: TextStyle(color: AppColors.white, fontSize: 14.sp),
            ))
      ],
    );
  }
}
