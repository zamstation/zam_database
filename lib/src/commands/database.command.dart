import '_.imports.dart';

abstract class DatabaseCommand<RESPONSE extends Object, ENTITY extends Entity,
    MODEL extends Object> implements AsyncCommand<RESPONSE> {
  Database get database;
  DatabaseState get databaseState;
  Table<ENTITY> get table;
  @protected
  Table<ENTITY> get resolvedTable =>
      table.resolvePath(databaseState.pathResolvers);

  const DatabaseCommand();

  Stream<RESPONSE> executeAndStream();
}
