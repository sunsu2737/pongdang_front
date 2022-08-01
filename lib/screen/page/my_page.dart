// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:emojumo/controller/user_controller.dart';
import 'package:emojumo/data/API/api_resource.dart';
import 'package:emojumo/screen/page/login_page.dart';
import 'package:emojumo/screen/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/navigationbar_controller.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final controller = Get.put(LandingPageController());
  final userLogin = false;
  
  @override
  Widget build(BuildContext context) {
    if (token == null) {
      return Login();
    } else {
      
      return Profile();
    }
  }
}
