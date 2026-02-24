import 'package:get/get.dart';
import 'package:getxlearnapp/getx/documentpage/documentpage_controller.dart';

class DocumentpageBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<DocumentpageController>(DocumentpageController());
  }

}