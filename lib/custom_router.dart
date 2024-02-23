// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/providers/list/list_provider.dart';
import 'package:task/view/home/home_window.dart';
import 'package:task/view/list/my_list.dart';
import 'package:task/view/map/my_map.dart';
import 'package:task/view/string/my_string.dart';

import 'core/app_components/app_routes.dart';

class CustomRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    var arg = settings.arguments == null ? {} : settings.arguments as Map;
    switch (settings.name) {
      case AppRoutes.home:
        return routeBuilder(HomeWindow());

      case AppRoutes.mylist:
        return routeBuilder(ChangeNotifierProvider(
            create: (context) => ListProvider(), child: MyList()));

      case AppRoutes.mymap:
        return routeBuilder(MyMap());

      case AppRoutes.mystring:
        return routeBuilder(MyString());

      default:
        return null;
    }
  }

//This is used for slide transition of the activities
  static PageRouteBuilder routeBuilder(Widget screen,
      {double? dx, double? dy, int? time}) {
    return PageRouteBuilder(
        opaque: true,
        transitionDuration: Duration(milliseconds: time ?? 100),
        pageBuilder: (BuildContext context, _, __) {
          return screen;
        },
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(dx ?? 1, dy ?? 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        });
  }
}
