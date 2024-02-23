// ignore_for_file: close_sinks

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task/core/utils/validators.dart';
import 'package:task/models/items.dart';
import 'package:task/providers/list/list_interface.dart';
import 'package:task/view/home/home_window.dart';

class ListViewModel {
  ListInterface interface;
  ListViewModel(this.interface);
  BehaviorSubject<String> nameStream = BehaviorSubject<String>();
  BehaviorSubject<String> ageStream = BehaviorSubject<String>();
  BehaviorSubject<String> phoneStream = BehaviorSubject<String>();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();

  Future addData(TodoItem item) async {
    await dao.addItemToTable(item);
    interface.onDataAdd(item);
  }

  Future fetchData() async {
    await dao.getAllItems().then((items) {
      interface.onDataFetched(items);
    });
  }

  Future deleteItem(String id) async {
    await dao.removeItem(id).then((value) {
      interface.onDataDelete(id);
    });
  }

  bool isValidName() {
    var v = Validators.isNameValid(nameController.text);
    nameStream.sink.add(v);
    return v.isEmpty;
  }

  bool isAgeValid() {
    var v = Validators.isAgeValid(ageController.text);
    ageStream.sink.add(v);
    return v.isEmpty;
  }

  bool isPhoneValid() {
    var v = Validators.isPhoneValid(phoneController.text);
    phoneStream.sink.add(v);
    return v.isEmpty;
  }
}
