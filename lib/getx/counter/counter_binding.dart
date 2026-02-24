import 'package:get/get.dart';
import 'package:getxlearnapp/getx/counter/counter_controller.dart';

class CounterBinding extends Bindings {

  CounterBinding(){
    print("CounterBinding running");
  }
  @override
  void dependencies(){
    Get.put<CounterController>(CounterController());
  }
}