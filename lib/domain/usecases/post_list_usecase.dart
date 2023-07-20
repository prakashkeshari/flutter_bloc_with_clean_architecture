import 'package:dartz/dartz.dart';
import 'package:test_app/domain/usecases/use_case.dart';
import '../../core/failure_model.dart';
import '../repositories/post_repository.dart';

class PostListUseCase extends UseCase<List<dynamic>, String> {
  late final PostRepository postRepository;

  PostListUseCase({required this.postRepository});

  @override
  Future<Either<FailureModel, List<dynamic>>> call(String params) =>
      postRepository.fetchPostListing(params);
}
