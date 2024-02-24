import 'package:flutter/material.dart';
import 'package:task/core/app_components/app_routes.dart';
import 'package:task/core/common_widgets/custom_appbar.dart';
import 'package:task/core/database/app_database/app_database.dart';
import 'package:task/core/database/todo/todo_dao.dart';

import '../../core/utils/global_variable.dart';
import '../../custom_router.dart';

late TodoDao dao;

class HomeWindow extends StatefulWidget {
  const HomeWindow({super.key});

  @override
  State<HomeWindow> createState() => _HomeWindowState();
}

class _HomeWindowState extends State<HomeWindow> {
  @override
  void initState() {
    super.initState();
    dao = TodoDao(AppDatabase());
  }

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
