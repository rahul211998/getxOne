import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearnapp/api/api_controller.dart';
import 'package:getxlearnapp/api/api_services.dart';
import 'package:getxlearnapp/getx/counter/counter_controller.dart';

class Dummyforapi extends StatefulWidget {
  const Dummyforapi({super.key});

  @override
  State<Dummyforapi> createState() => _DummyforapiState();
}

class _DummyforapiState extends State<Dummyforapi> {
  final dummyInstance = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    final ts = Get.find<CounterController>();

    return Scaffold(
      body: Column(
        children: [
          Obx(() => Text("${dummyInstance.dummyValue}")),
          // ElevatedButton(onPressed: dummyInstance.repoGivenValue, child: Text('click')),
          TextFormField(
            controller: dummyInstance.titleController,
          ),

          TextFormField(
            controller: dummyInstance.descriptionController,
          ),
          Text("${ts.counts}")
        ],
      ),
    );
  }
}
