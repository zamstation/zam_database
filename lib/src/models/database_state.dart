import '_.imports.dart';

@immutable
class DatabaseState with EquatableMixin implements Copyable<DatabaseState> {
  final Map<String, String> pathResolvers;

  @override
  get props => [pathResolvers];

  const DatabaseState({
    required this.pathResolvers,
  });

  @override
  DatabaseState copyWith({
    Map<String, String>? pathResolvers,
  }) {
    return DatabaseState(
      pathResolvers: pathResolvers ?? this.pathResolvers,
    );
  }
}
