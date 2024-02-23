import 'package:drift/drift.dart';

@DataClassName("TodoModel")
class Todo extends Table {
  TextColumn get name => text()();
  IntColumn get age => integer()();
  TextColumn get numbers => text()();
}
