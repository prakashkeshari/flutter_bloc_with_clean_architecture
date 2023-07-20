import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/data/entities/post_model.dart';
import 'package:test_app/presentation/bloc/post_bloc.dart';
import 'package:test_app/presentation/bloc/post_event.dart';
import 'package:test_app/presentation/bloc/post_state.dart';

class PostListScreen extends StatefulWidget {
  static const String id = "post_list_screen";

  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  //late TaskListController controller;
  late PostBloc _postBloc;
  int selectedPos = 2;

  @override
  void initState() {
    _postBloc = BlocProvider.of(context);
    _postBloc.add(FetchPostListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task Screen")),
      body: BlocConsumer<PostBloc, PostState>(
        builder: (context, state) {
          if (state is FetchPostsState) {
            return _postList(state.allPost);
          } else {
            return const Center(
              child: SizedBox(
                child: Text("Loading..."),
              ),
            );
          }
        },
        listener: (BuildContext context, state) {},
      ),
    );
  }

  Widget _postList(List<PostModel> list) {
    return Container(
        padding: const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final item = list[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8.0),
                Text(
                  item.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.start,
                ),
                Text(
                  item.body ?? "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16.0, color: Colors.grey),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 8.0),
                const Divider(
                  height: 1.0,
                ),
              ],
            );
          },
          itemCount: list.length,
        ));
  }
}
