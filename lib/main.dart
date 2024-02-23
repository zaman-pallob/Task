import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_components/app_colors.dart';
import 'core/app_components/app_routes.dart';
import 'core/utils/global_variable.dart';
import 'custom_router.dart';
import 'view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        designSize: Size(390, 844),
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: GlobalVariable.mainRouter,
            theme: ThemeData(
                primaryColor: AppColors.primary,
                appBarTheme: AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: AppColors.transparent,
                        systemNavigationBarDividerColor: AppColors.transparent,
                        statusBarBrightness: Brightness.light,
                        statusBarIconBrightness: Brightness.light))),
            initialRoute: AppRoutes.splash_screen,
            routes: {AppRoutes.splash_screen: (context) => SplashScreen()},
            onGenerateRoute: CustomRouter.onGenerateRoute));
  }
}
