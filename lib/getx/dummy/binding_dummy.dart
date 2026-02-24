import 'package:get/get.dart';
import 'package:getxlearnapp/api/api_controller.dart';
import 'package:getxlearnapp/api/api_services.dart';

class BindingDummy extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<ApiController>(ApiController(ApiServices()));
  }

}