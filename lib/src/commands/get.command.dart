import '_.imports.dart';
import 'read_one.command.dart';

abstract class GetCommand<ENTITY extends Entity, MODEL extends Object>
    extends ReadOneCommand<ENTITY, MODEL> {
  String get key;

  const GetCommand();

  @override
  Future<ENTITY> getEntity() {
    return database.get<ENTITY>(table, key: key);
  }
}
