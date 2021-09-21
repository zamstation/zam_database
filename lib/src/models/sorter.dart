class Sorter<T> {
  final String field;
  final bool reverse;

  const Sorter(
    this.field, {
    this.reverse = false,
  });
}
