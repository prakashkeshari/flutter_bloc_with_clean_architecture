import 'package:dartz/dartz.dart';
import 'package:test_app/core/failure_model.dart';
import 'package:test_app/domain/repositories/post_repository.dart';
import '../../core/injection_container.dart';
import '../../core/network/common_api_functions.dart';
import '../../core/network/network_api_calls.dart';

class PostRepositoryImpl implements PostRepository {
  final NetworkApiCalls networkApiCalls = sl<NetworkApiCalls>();

  //final Request request = serviceLocator<Request>();
  //PostRepositoryImpl(this.networkApiCalls);

  @override
  Future<Either<FailureModel, List<dynamic>>> fetchPostListing(
          String request) =>
      baseMethodToFetchExceptions(() => fetchPostListingApiCall());

  Future<Either<FailureModel, List<dynamic>>> fetchPostListingApiCall() async {
    //https://jsonplaceholder.typicode.com/posts
    //https://jsonplaceholder.typicode.com/todos
    Either<FailureModel, dynamic> response =
        await networkApiCalls.getRequestWithoutAuth("posts");
    if (response.isRight()) {
      List<dynamic> apiResponse = response.asRight();
      return Right(apiResponse);
    } else {
      return Left(response.asLeft());
    }
  }
}
