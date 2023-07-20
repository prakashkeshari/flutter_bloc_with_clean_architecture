import 'package:dartz/dartz.dart';
import '../../core/failure_model.dart';

abstract class PostRepository {
  Future<Either<FailureModel, List<dynamic>>> fetchPostListing(
      String request);
}
