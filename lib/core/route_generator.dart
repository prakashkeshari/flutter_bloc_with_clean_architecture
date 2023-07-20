import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/presentation/post_list_screen.dart';
import '../presentation/bloc/post_bloc.dart';

class RouteGenerator {

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PostListScreen.id:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PostBloc>.value(
            value: PostBloc(),
            child: const PostListScreen(),
          ),
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Error while loading new page'),
        ),
      );
    });
  }
}
