// ignore_for_file: close_sinks

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task/models/map_model.dart';
import 'package:task/providers/map/map_interface.dart';

import '../../core/utils/validators.dart';

class MapViewmodel {
  MapInterface interface;
  Map<String, int> usersinfo = MapModel().usersinfo;
  BehaviorSubject<String> ageStream = BehaviorSubject<String>();
  var ageController = TextEditingController();

  MapViewmodel(this.interface) {
    fetchMap();
  }

  void fetchMap() {
    interface.onFetchMap(usersinfo);
  }

  void modify(String key) {
    usersinfo[key] = int.parse(ageController.text);
    ageController.clear();
    interface.onModifiedMap(usersinfo);
  }

  bool isAgeValid() {
    var v = Validators.isAgeValid(ageController.text);
    ageStream.sink.add(v);
    return v.isEmpty;
  }
}
