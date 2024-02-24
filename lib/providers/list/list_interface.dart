import 'package:task/models/items.dart';

abstract class ListInterface {
  void onDataFetched(List<TodoItem> items);
  void onDataDelete(String id);
  void onDataAdd(TodoItem item);
}
