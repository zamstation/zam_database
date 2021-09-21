import '_.imports.dart';
import 'read.command.dart';

abstract class ReadManyCommand<ENTITY extends Entity, MODEL extends Object>
    extends ReadCommand<Iterable<MODEL>, ENTITY, MODEL> {
  const ReadManyCommand();

  Future<Iterable<ENTITY>> getEntities();

  Stream<Iterable<ENTITY>> getEntitiesStream();

  @override
  Future<Iterable<MODEL>> execute() async {
    return getEntities().then(convertToModels);
  }

  
  @override
  Stream<Iterable<MODEL>> executeAndStream() {
    return getEntitiesStream().map(convertToModels);
  }
}
