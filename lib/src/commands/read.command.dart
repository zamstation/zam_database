import '_.imports.dart';
import 'database.command.dart';

abstract class ReadCommand<
    RESPONSE extends Object,
    ENTITY extends Entity<MODEL>,
    MODEL extends Model> extends DatabaseCommand<RESPONSE, ENTITY, MODEL> {
  const ReadCommand();

  MODEL convertToModel(ENTITY entity) => entity.toModel();

  Iterable<MODEL> convertToModels(Iterable<ENTITY> entities) {
    return entities.map(convertToModel);
  }
}
