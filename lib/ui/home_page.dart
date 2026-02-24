import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:getxlearnapp/getx/counter/counter_controller.dart';
import 'package:getxlearnapp/getx/home/home_controller.dart';
import 'package:getxlearnapp/ui/counter_page.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends GetView<HomeController> {
  ImagePicker picker = ImagePicker();
  HomePage() {
    print("running Hoemnpage");
  }

  Future<void> pickImage() async{
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if(pickedImage != null){
      File imageFile = File(pickedImage.path);

      Uint8List imageBytes = await pickedImage.readAsBytes();

      print("imageBytes $imageBytes");

      Dio dio = Dio();

      
}}

  @override
  Widget build(BuildContext context) {
    // final ts = Get.find<CounterController>();
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Column(
          children: [
            // Obx(() => Text("Count: ${ts.counts}")),
            // ElevatedButton(
            //     onPressed: () async => await Get.toNamed('/counterpage'),
            //     child: Text("click")),
            ElevatedButton(
                onPressed: () => Get.toNamed('/dummyforapi'),
                child: Text('click')),
                ElevatedButton(onPressed: pickImage, child: Text("clicks")),
            Text("${controller.count}"),
            // Obx(() => Text(ts.count.toString())),
            Obx(
              () => Expanded(
                child: ListView.builder(
                    itemCount: controller.modelClassUser.length,
                    itemBuilder: (context,index) {
                      final users = controller.modelClassUser[index];
                      return ListTile(
                        title: Text(users.name),
                      );
                    }),
              ),
            ),
            // ElevatedButton(onPressed: pickImage, child: Text("click"))
          ],
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
