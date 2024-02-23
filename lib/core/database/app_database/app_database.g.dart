// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TodoTable extends Todo with TableInfo<$TodoTable, TodoModel> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _numbersMeta =
      const VerificationMeta('numbers');
  @override
  late final GeneratedColumn<String> numbers = GeneratedColumn<String>(
      'numbers', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [name, age, numbers];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo';
  @override
  VerificationContext validateIntegrity(Insertable<TodoModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('numbers')) {
      context.handle(_numbersMeta,
          numbers.isAcceptableOrUnknown(data['numbers']!, _numbersMeta));
    } else if (isInserting) {
      context.missing(_numbersMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TodoModel map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoModel(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age'])!,
      numbers: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}numbers'])!,
    );
  }

  @override
  $TodoTable createAlias(String alias) {
    return $TodoTable(attachedDatabase, alias);
  }
}

class TodoModel extends DataClass implements Insertable<TodoModel> {
  final String name;
  final int age;
  final String numbers;
  const TodoModel(
      {required this.name, required this.age, required this.numbers});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['age'] = Variable<int>(age);
    map['numbers'] = Variable<String>(numbers);
    return map;
  }

  TodoCompanion toCompanion(bool nullToAbsent) {
    return TodoCompanion(
      name: Value(name),
      age: Value(age),
      numbers: Value(numbers),
    );
  }

  factory TodoModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoModel(
      name: serializer.fromJson<String>(json['name']),
      age: serializer.fromJson<int>(json['age']),
      numbers: serializer.fromJson<String>(json['numbers']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'age': serializer.toJson<int>(age),
      'numbers': serializer.toJson<String>(numbers),
    };
  }

  TodoModel copyWith({String? name, int? age, String? numbers}) => TodoModel(
        name: name ?? this.name,
        age: age ?? this.age,
        numbers: numbers ?? this.numbers,
      );
  @override
  String toString() {
    return (StringBuffer('TodoModel(')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('numbers: $numbers')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, age, numbers);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoModel &&
          other.name == this.name &&
          other.age == this.age &&
          other.numbers == this.numbers);
}

class TodoCompanion extends UpdateCompanion<TodoModel> {
  final Value<String> name;
  final Value<int> age;
  final Value<String> numbers;
  final Value<int> rowid;
  const TodoCompanion({
    this.name = const Value.absent(),
    this.age = const Value.absent(),
    this.numbers = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TodoCompanion.insert({
    required String name,
    required int age,
    required String numbers,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        age = Value(age),
        numbers = Value(numbers);
  static Insertable<TodoModel> custom({
    Expression<String>? name,
    Expression<int>? age,
    Expression<String>? numbers,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (age != null) 'age': age,
      if (numbers != null) 'numbers': numbers,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TodoCompanion copyWith(
      {Value<String>? name,
      Value<int>? age,
      Value<String>? numbers,
      Value<int>? rowid}) {
    return TodoCompanion(
      name: name ?? this.name,
      age: age ?? this.age,
      numbers: numbers ?? this.numbers,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (numbers.present) {
      map['numbers'] = Variable<String>(numbers.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoCompanion(')
          ..write('name: $name, ')
          ..write('age: $age, ')
          ..write('numbers: $numbers, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $TodoTable todo = $TodoTable(this);
  late final TodoDao todoDao = TodoDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todo];
}
