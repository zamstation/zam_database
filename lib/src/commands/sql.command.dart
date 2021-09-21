import '_.imports.dart';
import 'read_many.command.dart';

abstract class SqlCommand<ENTITY extends Entity, MODEL extends Object>
    extends ReadManyCommand<ENTITY, MODEL> {
  const SqlCommand();

  Sql<ENTITY> buildSql();

  @override
  executeAndGetEntities() {
    final sql = buildSql();
    return database.executeSql(sql);
  }
}
