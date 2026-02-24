import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pagefour"),
      ),
      body: Column(
        children: [
          Container(
            child: Text("hellos"),
          ),
          ElevatedButton(onPressed: (){}, child: Text("click"),
          statesController: WidgetStatesController({WidgetState.focused}),)
        ],
      ),
    );
  }
}