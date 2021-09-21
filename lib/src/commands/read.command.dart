import '_.imports.dart';
import 'database.command.dart';

abstract class ReadCommand<RESPONSE extends Object, ENTITY extends Entity,
    MODEL extends Object> extends DatabaseCommand<RESPONSE, ENTITY, MODEL> {
  EntityToModelMapper<ENTITY, MODEL> get convertToModel;

  const ReadCommand();

  Iterable<MODEL> convertToModels(Iterable<ENTITY> entities) {
    return entities.map(convertToModel);
  }
}
