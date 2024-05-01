import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controller/controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(SQLController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("todo App"),
      centerTitle: true,
      actions: [
        TextButton(
            onPressed: () {
              controller.deleteDatabase();
            },
            child: const Text("Clear All"))
      ],
    ));
  }
}
