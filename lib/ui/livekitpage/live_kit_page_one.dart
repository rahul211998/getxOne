import 'package:flutter/material.dart';

class LiveKitPageOne extends StatefulWidget {
  const LiveKitPageOne({super.key});

  @override
  State<LiveKitPageOne> createState() => _LiveKitPageOneState();
}

class _LiveKitPageOneState extends State<LiveKitPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("live kit page"),
      ),
      body: Container(
        child: Text("hellos"),
      ),
    );
  }
}