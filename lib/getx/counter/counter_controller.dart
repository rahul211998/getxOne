import 'package:get/get.dart';

class CounterController extends GetxController {
  var counts = 100.obs;

  void increment(){
    counts++;
  }

  void add(int value){
    counts += value;
  }
}