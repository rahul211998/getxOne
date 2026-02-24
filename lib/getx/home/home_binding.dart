import 'package:get/get.dart';
import 'package:getxlearnapp/getx/counter/counter_controller.dart';
import 'package:getxlearnapp/getx/home/home_controller.dart';

class HomeBinding extends Bindings {

HomeBinding(){
  print("running homeBinding");
}


  
  @override
  // void dependencies(){
  //  final ts = Get.put<HomeController>(HomeController());
  //  print("ts $ts");
  // }

  void dependencies(){
   Get.lazyPut<HomeController>(() => HomeController());
   Get.put<CounterController>(CounterController());
  //  print("ts $ts");
  }
}