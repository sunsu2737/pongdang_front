// ignore_for_file: prefer_const_constructors

import '../../controller/navigationbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text("퐁당 퐁당"),
        centerTitle: true,
        backgroundColor: controller.main_color,
      ),
    );
  }
}
