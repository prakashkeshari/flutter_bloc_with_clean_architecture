// import 'package:get/get.dart';
// import 'package:test_app/core/injection_container.dart';
// import '../presentation/controller/task_list_controller.dart';
// import 'network/network_api_call_impl.dart';
// import 'network/network_api_calls.dart';
//
// class DependencyCreator {
//   static init() {
//     NetworkApiCalls getApiCallsObject() => Get.find<NetworkApiCalls>();
//     Get.put<NetworkApiCalls>(NetworkApiCallsImpl(), permanent: true);
//     Get.put<TaskListController>(TaskListController(taskListUseCase: sl()));
//   }
// }
