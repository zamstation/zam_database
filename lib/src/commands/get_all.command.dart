import '_.imports.dart';
import 'read_many.command.dart';

abstract class GetAllCommand<ENTITY extends Entity, MODEL extends Object>
    extends ReadManyCommand<ENTITY, MODEL> {
  Table<ENTITY> get table;

  const GetAllCommand();

  @override
  executeAndGetEntities() {
    return database.getAll<ENTITY>(table);
  }
}
