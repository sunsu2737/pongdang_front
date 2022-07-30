// ignore_for_file: prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:emojumo/screen/page/chatting_page.dart';
import 'package:emojumo/screen/page/my_page.dart';
import 'package:emojumo/screen/page/setting_page.dart';
import 'package:emojumo/screen/widget/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/navigationbar_controller.dart';
import 'page/home_page.dart';



class Landing extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              Home(),
              Chatting(),
              MyPage(),
              Setting()
            ],
          )),
    ));
  }
}