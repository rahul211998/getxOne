import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearnapp/getx/counter/counter_controller.dart';
import 'package:getxlearnapp/getx/movies/movies_controller.dart';
import 'package:getxlearnapp/ui/navigation/page_one.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {

  final CounterController controller = Get.find<CounterController>();
  MoviesController tsCounter = Get.find<MoviesController>();
  bool wwe = false;

  void block(){
    tsCounter.isBlock.value = true;
  }

    void unblock(){
    tsCounter.isBlock.value = false;
  }

  @override
  Widget build(BuildContext context) {
    // bool wwe = tsCounter.isBlock.value;
    print("tsCounter.isBlock.value 2 ${tsCounter.isBlock.value}");
    return Scaffold(appBar: AppBar(title: Text('getx'),),
    body: Column(
      children: [
        ElevatedButton(onPressed: () {

          // tsCounter.isBlock.value = !tsCounter.isBlock.value;
          tsCounter.isBlock.value == false ? block() : unblock();
          // tsCounter.isBlock.toggle();
          print("tsCounter.isBlock.value 2 ${tsCounter.isBlock.value}");
        }, child: Obx(() => tsCounter.isBlock.value == false ? Text("block") : Text("unblock"))),

       Obx(() => tsCounter.isBlock.value == false ? Text("unblocked") : Text("blocked")),
      ],
    ),);
  }
}