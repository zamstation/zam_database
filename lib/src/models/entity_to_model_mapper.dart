import '_.imports.dart';

typedef EntityToModelMapper<ENTITY extends Entity<MODEL>, MODEL extends Model>
    = MODEL Function(ENTITY entity);
