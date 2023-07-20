// import 'package:get/get.dart';
// import 'package:test_app/data/entaties/post_model.dart';
// import 'package:test_app/domain/usecases/post_list_usecase.dart';
//
// class TaskListController extends GetxController {
//   final PostListUseCase taskListUseCase;
//   RxList<PostModel> allPost = <PostModel>[].obs;
//
//   TaskListController({required this.taskListUseCase});
//
//   @override
//   void onInit() {
//     getTaskListing();
//     super.onInit();
//   }
//
//   Future<void> getTaskListing() async {
//     var response = await taskListUseCase.call("");
//
//     response.fold((failure) {
//       print("failure");
//     }, (apiResponse) {
//       allPost.addAll(apiResponse
//           .map<PostModel>((item) => PostModel.fromJson(item))
//           .toList());
//       print("object ${allPost.length}");
//     });
//   }
// }
