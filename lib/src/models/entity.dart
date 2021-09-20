import '_.imports.dart';

@immutable
abstract class Entity implements Identifiable<String>, Equatable {
  @override
  final stringify = true;

  const Entity();

  ///
  /// Children should implement this constructor.
  ///
  const Entity.fromJson(Map<String, Object> json);

  Map<String, Object> toJson();
}
