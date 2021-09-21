import '../database.service.dart';
import '_.imports.dart';

abstract class ReadCommand<RESPONSE extends Object, ENTITY extends Entity,
    MODEL extends Object> implements AsyncCommand<RESPONSE> {
  Database get database;
  EntityToModelMapper<ENTITY, MODEL> get mapper;

  const ReadCommand();

  @protected
  Stream<Object> executeAndGetEntities();

  Stream<RESPONSE> executeAndStayConnected();

  @override
  execute() {
    return executeAndStayConnected().first;
  }
}
