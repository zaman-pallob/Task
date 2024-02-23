import 'package:flutter/material.dart';
import 'package:task/core/app_components/app_routes.dart';
import 'package:task/core/common_widgets/custom_appbar.dart';

import '../../core/utils/global_variable.dart';
import '../../custom_router.dart';

class HomeWindow extends StatefulWidget {
  const HomeWindow({super.key});

  @override
  State<HomeWindow> createState() => _HomeWindowState();
}

class _HomeWindowState extends State<HomeWindow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: GlobalVariable.navigationRouter,
        onGenerateRoute: CustomRouter.onGenerateRoute,
        initialRoute: AppRoutes.mylist,
      ),
    );
  }
}
