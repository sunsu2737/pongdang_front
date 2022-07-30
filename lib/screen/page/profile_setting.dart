// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../controller/navigationbar_controller.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingPageController());
    return Scaffold(
      appBar: AppBar(
        title: Text("프로필 편집"),
        centerTitle: true,
        backgroundColor: controller.main_color,
      ),
      body:  Text("프로필 편집"),
    );
  }
}