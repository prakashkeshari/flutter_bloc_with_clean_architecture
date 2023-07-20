import 'package:dartz/dartz.dart';
import 'package:test_app/core/failure_model.dart';

abstract class NetworkApiCalls {
  Future<Either<FailureModel, dynamic>> getRequestWithAuth(
      String endpoint, String authToken, bool isCalling,
      {Map<String, dynamic> queryParams});

  Future<Either<FailureModel, dynamic>> getRequestWithoutAuth(String endpoint);
}
