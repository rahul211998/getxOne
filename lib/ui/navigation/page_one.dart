import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAnimPage extends StatefulWidget {
  const MyAnimPage({super.key});

  @override
  State<MyAnimPage> createState() => _MyAnimPageState();
}

class _MyAnimPageState extends State<MyAnimPage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: const Text("Hello"),
    );
  }
}
