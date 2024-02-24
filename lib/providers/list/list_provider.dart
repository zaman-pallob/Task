// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:task/models/items.dart';
import 'package:task/providers/list/list_interface.dart';
import 'package:task/providers/list/list_view_model.dart';

class ListProvider extends ChangeNotifier implements ListInterface {
  List<TodoItem> items = [];
  bool hasProgress = true;
  late ListViewModel viewModel;
  ListProvider() {
    viewModel = ListViewModel(this);
    viewModel.fetchData();
  }

  void addData(TodoItem item) {
    changeState(true);
    viewModel.addData(item);
  }

  void deleteData(String id) {
    changeState(true);
    viewModel.deleteItem(id);
  }

  @override
  void onDataAdd(TodoItem item) {
    items.insert(0, item);
    changeState(false);
  }

  @override
  void onDataDelete(String id) {
    items.removeWhere((element) => element.id == id);
    changeState(false);
  }

  @override
  void onDataFetched(List<TodoItem> items) {
    this.items = items;
    changeState(false);
  }

  changeState(bool v) {
    hasProgress = v;
    notifyListeners();
  }

  @override
  void dispose() {}
}
