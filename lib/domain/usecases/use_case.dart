import 'package:dartz/dartz.dart';
import 'package:test_app/core/failure_model.dart';




abstract class UseCase<Type, Params> {
  Future<Either<FailureModel, Type>> call(Params params);
}

abstract class UseCaseWithParameter<Type, Params, EndPoint> {
  Future<Either<FailureModel, Type>> call(Params params, EndPoint endPoint);
}

abstract class UseCaseWithoutParams<Type, Params> {
  Future<Either<FailureModel, Type>> call();
}
