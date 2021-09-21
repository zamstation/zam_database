import '_.imports.dart';

@immutable
abstract class Entity<MODEL extends Object>
    implements Identifiable<String>, Equatable {
  @override
  final stringify = true;

  const Entity();

  ///
  /// Children should implement this constructor.
  ///
  const Entity.fromJson(Map<String, Object> json);
  
  ///
  /// Children should implement this constructor.
  ///
  const Entity.fromModel(MODEL model);

  Map<String, Object> toJson();

  MODEL toModel();
}
