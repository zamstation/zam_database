import 'entity.dart';

typedef EntityToModelMapper<ENTITY extends Entity, MODEL extends Object> = MODEL
    Function(ENTITY entity);
