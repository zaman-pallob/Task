import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/map/map_provider.dart';
import 'package:task/view/map/components/map_card.dart';
import 'package:task/view/map/components/value_change_dialog.dart';

class MyMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          itemCount: provider.usersinfo.length,
          itemBuilder: (context, index) {
            var key = provider.usersinfo.keys.elementAt(index);

            return MapCard(
              name: key,
              age: provider.usersinfo[key].toString(),
              onEdit: () {
                ValueChangeDialog.open(provider: provider, key: key);
              },
            );
          },
        );
      },
    );
  }
}
