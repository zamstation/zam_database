import '_.imports.dart';

@immutable
class Table<ENTITY extends Entity>
    with EquatableMixin
    implements Identifiable<String> {
  @override
  final String key;
  final String name;
  final String? path;
  final String? pathTemplate;
  final Serialize<ENTITY> serialize;
  final Deserialize<ENTITY> createEntity;
  final String _openDelimiter;
  final String _closeDelimiter;
  final String _pathDelimiter;

  @override
  get props => [key, name, path, pathTemplate];

  const Table({
    String? key,
    required this.name,
    this.path,
    this.pathTemplate,
    required this.serialize,
    required this.createEntity,
    String openDelimiter = '{',
    String closeDelimiter = '}',
    String pathDelimiter = '/',
  })  : assert(path != null || pathTemplate != null),
        key = key ?? name,
        _openDelimiter = openDelimiter,
        _closeDelimiter = closeDelimiter,
        _pathDelimiter = pathDelimiter;

  ///
  /// [BANG OPERATOR ALERT]!
  ///
  Table<ENTITY> resolvePath(Map<String, String> pathResolvers) {
    assert(pathTemplate != null);

    String _getResolvedPath(String path, String key) {
      final pattern = '$_openDelimiter$key$_closeDelimiter';
      return path.replaceAll(pattern, pathResolvers[key]!);
    }

    final resolvedPath =
        pathResolvers.keys.fold<String>(pathTemplate!, _getResolvedPath);

    return Table(
      key: key,
      name: name,
      path: resolvedPath,
      pathTemplate: pathTemplate,
      serialize: serialize,
      createEntity: createEntity,
      pathDelimiter: _pathDelimiter,
      openDelimiter: _openDelimiter,
      closeDelimiter: _closeDelimiter,
    );
  }
}
