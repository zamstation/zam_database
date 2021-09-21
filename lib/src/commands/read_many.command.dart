import '_.imports.dart';
import 'read.command.dart';

abstract class ReadManyCommand<ENTITY extends Entity, MODEL extends Object>
    extends ReadCommand<Iterable<MODEL>, ENTITY, MODEL> {
  const ReadManyCommand();

  @override
  Stream<Iterable<ENTITY>> executeAndGetEntities();

  @override
  executeAndStayConnected() {
    return executeAndGetEntities().map((list) => list.map(mapper));
  }
}
