import '_.imports.dart';
import 'database.command.dart';

abstract class UpdateCommand<ENTITY extends Entity, MODEL extends Object>
    extends DatabaseCommand<String, ENTITY, MODEL> {
  MODEL get item;

  const UpdateCommand();

  @override
  execute() {
    return database.update<ENTITY>(table, item: mapper(item));
  }
}
