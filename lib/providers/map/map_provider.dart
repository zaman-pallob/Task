// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:task/providers/map/map_interface.dart';
import 'package:task/providers/map/map_viewmodel.dart';

class MapProvider extends ChangeNotifier implements MapInterface {
  late MapViewmodel viewmodel;
  Map<String, int> usersinfo = {};
  MapProvider() {
    viewmodel = MapViewmodel(this);
  }

  @override
  void onFetchMap(Map<String, int> usersinfo) {
    this.usersinfo = usersinfo;
    notifyListeners();
  }

  @override
  void onModifiedMap(Map<String, int> userinfo) {
    this.usersinfo = userinfo;
    notifyListeners();
  }

  @override
  void dispose() {}
}
