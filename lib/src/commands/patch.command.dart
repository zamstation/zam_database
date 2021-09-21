import '_.imports.dart';
import 'database.command.dart';

abstract class PatchCommand<ENTITY extends Entity, MODEL extends Object>
    extends DatabaseCommand<String, ENTITY, MODEL> {
  MODEL get item;

  const PatchCommand();

  @override
  execute() {
    return database.patch<ENTITY>(table, item: mapper(item));
  }
}
