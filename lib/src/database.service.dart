import 'models/_.index.dart';

///
/// Interface for all database services
///
abstract class Database {
  DatabaseConfig get config;

  Future<bool> exists<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required String searchColumn,
    required String operator,
    required Object searchKey,
  });

  Stream<ENTITY> get<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required String key,
  });

  Future<ENTITY> lookup<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required String searchColumn,
    Object searchKey,
  });

  Stream<Iterable<ENTITY>> getAll<ENTITY extends Entity>(
    Table<ENTITY> table,
  );

  Stream<Iterable<ENTITY>> getFirst<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required int limit,
  });

  Stream<Iterable<ENTITY>> getMany<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required List<String> keys,
  });

  Stream<Iterable<ENTITY>> where<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required String searchColumn,
    required String operator,
    required Object searchKey,
  });

  Stream<Iterable<ENTITY>> filter<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required String searchColumn,
    required String operator,
    required Object searchKey,
  }) {
    return where(
      table,
      searchColumn: searchColumn,
      operator: operator,
      searchKey: searchKey,
    );
  }

  Stream<ENTITY> find<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required String searchColumn,
    required Object searchKey,
  });

  Stream<Iterable<ENTITY>> findMany<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required String searchColumn,
    required List<String> searchKeys,
  });

  Stream<ENTITY> forceGet<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required ENTITY item,
    required String searchColumn,
    Object searchKey,
  });

  Stream<ENTITY> forceLookup<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required ENTITY item,
    required String searchColumn,
    Object searchKey,
  });

  Future<void> clone<E1 extends Entity, E2 extends Entity>({
    required Table<E1> sourceTable,
    required Table<E2> targetTable,
    bool replace = false,
  });

  Future<String> add<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required ENTITY item,
  });

  Future<Iterable<String>> addMany<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required List<ENTITY> items,
  });

  Future<String> addWithKey<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required ENTITY item,
  });

  Future<String> update<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required ENTITY item,
    String searchColumn,
    Object searchKey,
  });

  Future<String> updateElseAdd<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required ENTITY item,
    String searchColumn,
    Object searchKey,
  });

  Future<String> patch<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required ENTITY item,
    String searchColumn,
    Object searchKey,
  });

  Future<String> patchMany<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required List<ENTITY> items,
    String searchColumn,
    Object searchKey,
  });

  Future<ENTITY> remove<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required String key,
  });

  Future<ENTITY> removeMany<ENTITY extends Entity>(
    Table<ENTITY> table, {
    required List<String> keys,
  });
}
