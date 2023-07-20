import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_app/core/initial_binding.dart';
import 'package:test_app/presentation/post_list_screen.dart';

import '../core/route_generator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PostListScreen.id,
      onGenerateRoute: RouteGenerator().generateRoute,
      //initialBinding: InitialBinding(),
      //home: const TaskListScreen(),
    );
  }
}
