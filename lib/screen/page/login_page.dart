// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:emojumo/controller/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/navigationbar_controller.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);
  void openDialog(StreamController<String?> streamController) {
    Get.dialog(
      StreamBuilder(
          stream: streamController.stream,
          builder: (context, snapshot) {
            if (snapshot.data == "400") {
              return AlertDialog(
                content: const Text('이메일과 비밀번호를 확인해주세요.'),
                actions: [
                  TextButton(
                    child: const Text("확인"),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              );
              
            } else if (snapshot.data == "200") {
              return AlertDialog(
                content: const Text('로그인 되었습니다.'),
                actions: [
                  TextButton(
                    child: const Text("확인"),
                    onPressed: () => Get.offAllNamed('/'),
                  ),
                ],
              );
            } else {
              return AlertDialog(
                content: Row(
                  children: [
                    CircularProgressIndicator(),
                    Container(
                        margin: EdgeInsets.only(left: 7), child: Text("로그인 중")),
                  ],
                ),
              );
            }
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingPageController());
    final inputController = Get.put(LoginInputController());
    StreamController<String> streamController =
        StreamController<String>.broadcast();
    return Scaffold(
      appBar: AppBar(
        title: const Text("로그인"),
        centerTitle: true,
        backgroundColor: controller.main_color,
      ),
      body: Center(
        child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '이메일',
                    ),
                    onChanged: (value) {
                      inputController.email = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호',
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      inputController.password = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          inputController.trySubmit(streamController);
                          openDialog(streamController);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: controller.main_color),
                        child: Text("로그인")),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "또는",
                      style: TextStyle(height: 4),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Get.toNamed('/signup');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: controller.main_color),
                        child: Text("회원가입")),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
