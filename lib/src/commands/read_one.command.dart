import '_.imports.dart';
import 'read.command.dart';

abstract class ReadOneCommand<ENTITY extends Entity, MODEL extends Object>
    extends ReadCommand<MODEL, ENTITY, MODEL> {
  const ReadOneCommand();

  @override
  Stream<ENTITY> executeAndGetEntities();

  @override
  executeAndStayConnected() {
    return executeAndGetEntities().map(mapper);
  }
}
