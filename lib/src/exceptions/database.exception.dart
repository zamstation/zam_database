import '_.imports.dart';

abstract class DatabaseException extends NamedException {
  @override
  Type get category => DatabaseException;

  const DatabaseException();
}
