import '_.imports.dart';

abstract class DatabaseCommand<RESPONSE extends Object, ENTITY extends Entity,
    MODEL extends Object> implements AsyncCommand<RESPONSE> {
  Database get database;
  Table<ENTITY> get table;
  ModelToEntityMapper<MODEL, ENTITY> get mapper;

  const DatabaseCommand();
}
