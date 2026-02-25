import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getxlearnapp/getx/movies/movies_controller.dart';
import 'package:getxlearnapp/model/movies_model.dart';

class Movies extends StatelessWidget {
  Movies({super.key});

  MoviesController ts = Get.find<MoviesController>();

  void block() {
    ts.isBlock.value = true;
  }

  void unblock() {
    ts.isBlock.value = false;
  }

  void amazing(){
    print("best of best");
  }

  void showBlockDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        bool isBlockDup = ts.isBlock.value;
        print("isBlockDup is $isBlockDup");
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text("Do you want to block?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // cancel
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                print("isBlockDup is ${!isBlockDup}");
                ts.isBlock.value = !isBlockDup; // ✅ update GetX state
                Navigator.pop(context); // close dialog
              },
              child: const Text("Block"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("ts.isBlock.value 1 ${ts.isBlock.value}");
    // MoviesController ts = Get.find<MoviesController>();
    MoviesModel moviesModel = MoviesModel(
        movieName: ts.movieName.value, collection: ts.collection.value);
    return Scaffold(
      appBar: AppBar(
        title: Text("movies"),
      ),
      body: Column(
        children: [
          Obx(() =>
              ts.isBlock.value == false ? Text("unblocked") : Text("blocked")),
          ElevatedButton(
              onPressed: () {
                ts.isBlock.value == false
                    ? showBlockDialog(context)
                    : unblock();
              },
              child: Obx(
                  () => Text(ts.isBlock.value == false ? "block" : "unblock"))),
          ElevatedButton(
              onPressed: () => Get.toNamed("/counterpage"),
              child: Text("click")),
          ElevatedButton(
              onPressed: () => Get.toNamed("/pageTwo"),
              child: Text("click"))
        ],
      ),
    );
  }
}
