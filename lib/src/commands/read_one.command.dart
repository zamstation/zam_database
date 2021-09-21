import '_.imports.dart';
import 'read.command.dart';

abstract class ReadOneCommand<ENTITY extends Entity, MODEL extends Object>
    extends ReadCommand<MODEL, ENTITY, MODEL> {
  const ReadOneCommand();

  Future<ENTITY> getEntity();

  Stream<ENTITY> getEntityStream();

  @override
  Future<MODEL> execute() {
    return getEntity().then(convertToModel);
  }

  @override
  Stream<MODEL> executeAndStream() {
    return getEntityStream().map(convertToModel);
  }
}
