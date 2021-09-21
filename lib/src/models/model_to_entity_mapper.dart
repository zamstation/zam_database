import 'entity.dart';

typedef ModelToEntityMapper<MODEL extends Object, ENTITY extends Entity>
    = ENTITY Function(MODEL model);
