import 'package:test_app/data/entities/post_model.dart';

abstract class PostState {}

class InitialState extends PostState {}

class FetchPostsError extends PostState {}

class FetchPostsState extends PostState {
  late final List<PostModel> allPost;
  FetchPostsState(this.allPost);
}

