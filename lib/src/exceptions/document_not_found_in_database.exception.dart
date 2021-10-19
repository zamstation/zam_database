import '_.imports.dart';
import 'database.exception.dart';

class DocumentNotFoundInDatabaseException extends DatabaseException {
  final String tablePath;
  final String documentKey;

  @override
  String get problem => 'Document with key \'$documentKey\' not found.';
  @override
  String get solution =>
      'Please make sure the document exists in \'$tablePath\'.';
  @override
  ExceptionSeverity get severity => ExceptionSeverity.critical;

  const DocumentNotFoundInDatabaseException(this.tablePath, this.documentKey);
}
