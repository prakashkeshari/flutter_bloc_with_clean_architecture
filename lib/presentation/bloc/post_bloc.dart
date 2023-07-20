import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data/entities/post_model.dart';
import 'package:test_app/presentation/bloc/post_event.dart';
import 'package:test_app/presentation/bloc/post_state.dart';

import '../../core/injection_container.dart';
import '../../domain/usecases/post_list_usecase.dart';

class PostBloc extends Bloc<PostEvent, PostState> {

  PostBloc() : super(InitialState()) {
    on<FetchPostListEvent>(_fetchCountriesData);
  }

  List<PostModel> allPost = [];

  Future<void> _fetchCountriesData(
      FetchPostListEvent event, Emitter<PostState> emit) async {
    emit(InitialState());
    var response = await sl<PostListUseCase>().call("");
    response.fold((failure) {
      print("failure");
    }, (apiResponse) {
      allPost.addAll(apiResponse
          .map<PostModel>((item) => PostModel.fromJson(item))
          .toList());
      print("object ${allPost.length}");
      emit(FetchPostsState(allPost));
    });
  }
}
