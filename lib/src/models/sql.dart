import '_.imports.dart';
import 'filter.dart';
import 'filter_operator.dart';
import 'sorter.dart';
import 'table.dart';

@immutable
class Sql<ENTITY extends Entity> implements Copyable<Sql<ENTITY>> {
  final Table<ENTITY> table;
  final List<Filter> filterList;
  final List<Sorter> sorterList;
  final int skipValue;
  final int limitValue;

  const Sql(
    this.table, {
    this.filterList = const [],
    this.sorterList = const [],
    this.skipValue = -1,
    this.limitValue = -1,
  });

  const Sql.selectFrom(Table<ENTITY> table) : this(table);

  Sql<ENTITY> where<T>(String field, FilterOperator operator, Object value) {
    final newFilter = Filter(field, operator, value);
    return filterWith(newFilter);
  }

  Sql<ENTITY> filterWith(Filter filter) {
    final newFilterList = [...filterList, filter];

    return copyWith(filterList: newFilterList);
  }

  Sql<ENTITY> orderBy<T>(String field, {bool reverse = false}) {
    final newSorter = Sorter(field, reverse: reverse);
    return sortWith(newSorter);
  }

  Sql<ENTITY> sort<T>(String field, {bool reverse = false}) {
    return orderBy(field, reverse: reverse);
  }

  Sql<ENTITY> sortWith(Sorter sorter) {
    final newSorterList = [...sorterList, sorter];

    return copyWith(sorterList: newSorterList);
  }

  Sql<ENTITY> limit<T>(int limitValue) {
    assert(this.limitValue != 0);

    return copyWith(limitValue: limitValue);
  }

  @override
  Sql<ENTITY> copyWith({
    Table<ENTITY>? table,
    List<Filter>? filterList,
    List<Sorter>? sorterList,
    int? skipValue,
    int? limitValue,
  }) {
    return Sql(
      table ?? this.table,
      filterList: filterList ?? this.filterList,
      sorterList: sorterList ?? this.sorterList,
      skipValue: skipValue ?? this.skipValue,
      limitValue: limitValue ?? this.limitValue,
    );
  }
}
