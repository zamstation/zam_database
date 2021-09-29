import '_.imports.dart';

typedef ModelToEntityMapper<MODEL extends Model, ENTITY extends Entity<MODEL>>
    = ENTITY Function(MODEL model);
