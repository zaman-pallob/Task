import 'package:drift/drift.dart';
import 'package:task/core/database/todo/todo.dart';
import 'package:task/models/items.dart';

import '../app_database/app_database.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: [Todo])
class TodoDao extends DatabaseAccessor<AppDatabase> with _$TodoDaoMixin {
  TodoDao(AppDatabase db) : super(db);

  Future<List<TodoItem>> getAllItems() async {
    var ob = await select(todo).get();
    List<TodoItem> items = [];
    ob.forEach((element) {
      items.add(TodoItem(
          id: element.id,
          name: element.name,
          age: element.age,
          numbers: element.numbers));
    });
    return items;
  }

  Future addItemToTable(TodoItem item) async {
    var ob = await _getItem(item.id);
    if (ob == null) {
      await _insertItem(TodoModel(
        id: item.id,
        name: item.name,
        age: item.age,
        numbers: item.numbers,
      ));
    } else {
      await _updateItem(TodoModel(
        id: item.id,
        name: item.name,
        age: item.age,
        numbers: item.numbers,
      ));
    }
  }

  Future<TodoModel?> _getItem(String id) =>
      (select(todo)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future _insertItem(TodoModel model) => into(todo).insert(model);

  Future _updateItem(TodoModel model) async {
    await customUpdate(
        "UPDATE todo SET name= '${model.name}', numbers='${model.numbers}', age=${model.age}  WHERE id = '${model.id}' ;");
  }

  Future removeItem(String id) =>
      (delete(todo)..where((tbl) => tbl.id.equals(id))).go();
}
