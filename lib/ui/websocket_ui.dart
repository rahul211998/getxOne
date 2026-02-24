import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WebsocketUi extends StatelessWidget {
  const WebsocketUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('websocket'),
      ),
      body: Column(
        children: [
          Container(
            child: Text('hellos'),
          ),
          Text("language"),
          ElevatedButton(onPressed: (){}, child: Text("click")),
        ],
      ),
    );
  }
}