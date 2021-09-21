import '_.imports.dart';
import 'sql.command.dart';

abstract class FilterCommand<ENTITY extends Entity, MODEL extends Object,
    FIELD extends Object> extends SqlCommand<ENTITY, MODEL> {
  Table<ENTITY> get table;

  const FilterCommand();

  Filter<FIELD> buildFilter();

  @override
  buildSql() {
    final filter = buildFilter();
    return Sql.selectFrom(table).filterWith(filter);
  }
}
