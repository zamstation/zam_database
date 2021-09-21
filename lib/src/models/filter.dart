import 'filter_operator.dart';

class Filter<T extends Object> {
  final String field;
  final FilterOperator operator;
  final T value;

  const Filter(this.field, this.operator, this.value);

  Object? getValueFor(FilterOperator operator) {
    return this.operator == operator ? value : null;
  }
}
