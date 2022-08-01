// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:emojumo/controller/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/navigationbar_controller.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);
  void openDialog(int status, StreamController<String?> streamController) {
    if (status == 200) {
      Get.dialog(
        AlertDialog(
          content: const Text('회원가입 완료!\n입력하신 이메일로 인증 메일을 전송했습니다. 링크를 클릭해 인증해 주세요.'),
          actions: [
            TextButton(
              child: const Text("확인"),
              onPressed: () => Get.offAllNamed('/'),
            ),
          ],
        ),
      );
    } else if (status == 500) {
      streamController.add("complete");

      Get.dialog(
        AlertDialog(
          content: const Text('회원가입 실패!'),
          actions: [
            TextButton(
              child: const Text("확인"),
              onPressed: () => Get.back(),
            ),
          ],
        ),
      );
    } else {
      streamController.add("complete");
      Get.dialog(
        AlertDialog(
          content: const Text('이름이 중복됐습니다!'),
          actions: [
            TextButton(
              child: const Text("확인"),
              onPressed: () => Get.back(),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingPageController());
    final inputController = Get.put(SignupInputController());
    String nickname = '';
    String email = '';
    String password = '';
    String passwordCheck = '';
    StreamController<String> streamController = StreamController<String>();
    streamController.add("complete");

    return Scaffold(
      appBar: AppBar(
        title: const Text("회원가입"),
        centerTitle: true,
        backgroundColor: controller.main_color,
      ),
      body: Center(
          child: StreamBuilder<Object>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.data == "complete") {
                  return SizedBox(
                      width: 300,
                      child: Form(
                        key: inputController.formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                initialValue: nickname,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '이름',
                                ),
                                validator: (value) {
                                  return inputController
                                      .nicknameValidator(value!);
                                },
                                onSaved: (value) {
                                  inputController.nickname = value!;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                initialValue: email,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '이메일',
                                ),
                                validator: (value) {
                                  return inputController.emailValidator(value!);
                                },
                                onSaved: (value) {
                                  inputController.email = value!;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                initialValue: password,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '비밀번호',
                                ),
                                obscureText: true,
                                validator: (value) {
                                  inputController.password = value!;
                                  return inputController
                                      .passwordValidator(value);
                                },
                                onSaved: (value) {
                                  inputController.password = value!;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                initialValue: passwordCheck,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: '비밀번호 확인',
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value != inputController.password) {
                                    return "비밀번호가 일치하지 않습니다.";
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  inputController.passwordCheck = value!;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () async {
                                      inputController.formKey.currentState!
                                          .save();
                                      nickname = inputController.nickname;
                                      email = inputController.email;
                                      password = inputController.password;
                                      passwordCheck =
                                          inputController.passwordCheck;

                                      int status = await inputController
                                          .trySubmit(streamController);
                                      openDialog(status, streamController);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: controller.main_color),
                                    child: Text("회원가입")),
                              ],
                            ),
                          ],
                        ),
                      ));
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }
}
