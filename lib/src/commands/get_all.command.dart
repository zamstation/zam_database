import '_.imports.dart';
import 'read_many.command.dart';

abstract class GetAllCommand<ENTITY extends Entity<MODEL>, MODEL extends Model>
    extends ReadManyCommand<ENTITY, MODEL> {
  const GetAllCommand();

  @override
  Future<Iterable<ENTITY>> getEntities() {
    return database.getAll<ENTITY>(resolvedTable);
  }

  @override
  Stream<Iterable<ENTITY>> getEntitiesStream() {
    return database.streamAll<ENTITY>(resolvedTable);
  }
}
