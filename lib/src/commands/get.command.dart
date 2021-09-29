import '_.imports.dart';
import 'read_one.command.dart';

abstract class GetCommand<ENTITY extends Entity<MODEL>, MODEL extends Model>
    extends ReadOneCommand<ENTITY, MODEL> {
  String get key;

  const GetCommand();

  @override
  Future<ENTITY> getEntity() {
    return database.get<ENTITY>(table, key: key);
  }

  @override
  Stream<ENTITY> getEntityStream() {
    return database.stream<ENTITY>(table, key: key);
  }
}
