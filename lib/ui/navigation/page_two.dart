// import 'package:flutter/material.dart';

// class PageTwo extends StatefulWidget {
//   const PageTwo({super.key});

//   @override
//   State<PageTwo> createState() => _PageTwoState();
// }

// class _PageTwoState extends State<PageTwo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: Text('pageTwo'),),);
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearnapp/getx/movies/movies_controller.dart';
// import 'package:getxlearnapp/ui/movies.dart';
import 'package:getxlearnapp/ui/navigation/movies.dart';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  MoviesController tsss = Get.find<MoviesController>();

  @override
  void initState() {
    super.initState();
    print("PageTwo initState");
  }

  @override
  void dispose() {
    print("PageTwo disposed"); // You will see this when Get.off() runs
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PageTwo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.off(() => Movies()); // 🔥 Replace PageTwo with Movies
          },
          child: Obx(() => Text("${tsss.isBlock.value}")),
        ),
      ),
    );
  }
}