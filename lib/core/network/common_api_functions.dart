import 'package:dartz/dartz.dart';
import 'package:test_app/core/failure_model.dart';
import '../constant.dart';
import 'server_exception.dart';

Future<Either<FailureModel, T>> baseMethodToFetchExceptions<T>(
    Future<Either<FailureModel, T>> Function() baseMethod) async {
  try {
    return await baseMethod();
  } on InternetException {
    return Left(
        FailureModel(errorMessage: INTERNET_CONNECTION, statusCode: null));
  } on ApiException catch (e) {
    return Left(FailureModel(errorMessage: e.message, statusCode: null));
  } on ServerException {
    return Left(FailureModel(errorMessage: SERVER_EXCEPTION, statusCode: null));
  } on UnAuthorisedException {
    return Left(
        FailureModel(errorMessage: USER_UNAUTHORISED, statusCode: null));
  } on CacheException catch (e) {
    return Left(FailureModel(errorMessage: e.message, statusCode: null));
  } on Exception catch (e) {
    return Left(FailureModel(errorMessage: e.toString(), statusCode: null));
  }
}

extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right).value;

  L asLeft() => (this as Left).value;
}
