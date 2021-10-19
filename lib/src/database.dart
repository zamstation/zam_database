import 'package:zam_core/infrastructure.dart' show Entity;

import 'models/_.index.dart';

///
/// Interface for all database services.
///
abstract class Database {
  DatabaseConfig get config;

  Future<bool> exists<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required String key,
  });

  Future<ENTITY> get<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required String key,
  });

  Future<Iterable<ENTITY>> getAll<ENTITY extends Entity>(
    Table<ENTITY> table,
  );

  Future<Iterable<ENTITY>> getFirst<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required int limit,
  });

  Future<Iterable<ENTITY>> getMultiple<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required List<String> keys,
  });

  Stream<ENTITY> stream<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required String key,
  });

  Stream<Iterable<ENTITY>> streamAll<ENTITY extends Entity>(
    Table<ENTITY> table,
  );

  Stream<Iterable<ENTITY>> streamMultiple<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required List<String> keys,
  });
}
