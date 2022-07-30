// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/navigationbar_controller.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text("환경 설정"),
        centerTitle: true,
        backgroundColor: controller.main_color,
      ),
    );
  }
}
