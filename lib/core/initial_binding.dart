import 'package:get/get.dart';
import 'package:test_app/core/network/network_api_calls.dart';
import 'package:test_app/core/network/network_api_call_impl.dart';
import 'package:test_app/presentation/controller/task_list_controller.dart';

import 'injection_container.dart';

class InitialBinding implements Bindings {

  @override
  void dependencies() async {
    //Get.put<NetworkApiCalls>(NetworkApiCallsImpl(), permanent: true);
    //Get.put<TaskListController>(TaskListController(taskListUseCase: sl()));
  }
  //NetworkApiCalls getApiCallsObject() => Get.find<NetworkApiCalls>();

}
