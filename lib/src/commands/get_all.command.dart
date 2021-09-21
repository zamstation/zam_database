import '_.imports.dart';
import 'read_many.command.dart';

abstract class GetAllCommand<ENTITY extends Entity, MODEL extends Object>
    extends ReadManyCommand<ENTITY, MODEL> {
  const GetAllCommand();

  @override
  Future<Iterable<ENTITY>> getEntities() {
    return database.getAll<ENTITY>(table);
  }

  @override
  Stream<Iterable<ENTITY>> getEntitiesStream() {
    return database.streamAll<ENTITY>(table);
  }
}
