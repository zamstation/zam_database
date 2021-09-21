import '_.imports.dart';
import 'read_one.command.dart';

abstract class GetCommand<ENTITY extends Entity, MODEL extends Object>
    extends ReadOneCommand<ENTITY, MODEL> {
  Table<ENTITY> get table;
  String get key;

  const GetCommand();

  @override
  executeAndGetEntities() {
    return database.get<ENTITY>(table, key: key);
  }
}
