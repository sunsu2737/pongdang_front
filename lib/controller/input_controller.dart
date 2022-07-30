// ignore_for_file: unnecessary_overrides, prefer_const_constructors, non_constant_identifier_names

import 'dart:async';

import '../data/API/user_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/API/user_model.dart';

class LoginInputController extends GetxController {
  String email = '';
  String password = '';
  late UserMom userMom;

  trySubmit(StreamController streamController) async {
    Get.focusScope!.unfocus();

    streamController.add("loading");

    userMom = UserMom(email: email, password: password);
    int status = await loginPost(userMom);
    streamController.add(status.toString());
    print(status.toString());

    // User those values to send our auth request ...
  }
}

class SignupInputController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String nickname = '';
  String password = '';
  String passwordCheck = '';
  late UserMom userMom;

  String? emailValidator(String value) {
    if (value.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return '올바른 이메일 형식을 입력하세요.';
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty || value.length < 7) {
      return '7자리 이상의 비밀번호를 사용해주세요.';
    }
    return null;
  }

  String? nicknameValidator(String value) {
    if (value.isEmpty) {
      return '이름을 입력해주세요.';
    }

    return null;
  }

  trySubmit(StreamController streamController) async {
    final isValid = formKey.currentState!.validate();
    Get.focusScope!.unfocus();

    if (isValid) {
      streamController.add("loading");
      userMom = UserMom(email: email, nickname: nickname, password: password);
      int status = await signupPost(userMom);

      return status;
      // User those values to send our auth request ...
    }
  }
}
