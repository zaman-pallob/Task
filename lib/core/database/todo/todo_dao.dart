import 'package:drift/drift.dart';
import 'package:task/core/database/todo/todo.dart';

import '../app_database/app_database.dart';

part 'todo_dao.g.dart';

@DriftAccessor(tables: [Todo])
class TodoDao extends DatabaseAccessor<AppDatabase> with _$TodoDaoMixin {
  TodoDao(AppDatabase db) : super(db);
}
