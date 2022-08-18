// ignore_for_file: unnecessary_overrides, prefer_const_constructors, non_constant_identifier_names

import 'dart:io';
import 'dart:convert';
import 'package:emojumo/data/API/user_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridController extends GetxController {
  var images = [
    "https://img.insight.co.kr/static/2019/09/26/700/t2q46y20edlnh3396x24.jpg",
    "https://image.fmkorea.com/files/attach/new/20191026/486616/657118072/2319685464/3b655332b9f134c56574c9183abbaebb.jpeg",
    "https://i.ytimg.com/vi/85gnUXcd_T4/mqdefault.jpg",
    "https://image.fmkorea.com/files/attach/new/20191026/486616/657118072/2319685464/3b655332b9f134c56574c9183abbaebb.jpeg",
    "https://i.ytimg.com/vi/85gnUXcd_T4/mqdefault.jpg",
    "https://image.fmkorea.com/files/attach/new/20191026/486616/657118072/2319685464/3b655332b9f134c56574c9183abbaebb.jpeg",
    "https://i.ytimg.com/vi/85gnUXcd_T4/mqdefault.jpg",
    "https://image.fmkorea.com/files/attach/new/20191026/486616/657118072/2319685464/3b655332b9f134c56574c9183abbaebb.jpeg",
    "https://i.ytimg.com/vi/85gnUXcd_T4/mqdefault.jpg",
    "https://image.fmkorea.com/files/attach/new/20191026/486616/657118072/2319685464/3b655332b9f134c56574c9183abbaebb.jpeg",
    "https://i.ytimg.com/vi/85gnUXcd_T4/mqdefault.jpg",
    "https://image.fmkorea.com/files/attach/new/20191026/486616/657118072/2319685464/3b655332b9f134c56574c9183abbaebb.jpeg",
    "https://i.ytimg.com/vi/85gnUXcd_T4/mqdefault.jpg",
    "https://image.fmkorea.com/files/attach/new/20191026/486616/657118072/2319685464/3b655332b9f134c56574c9183abbaebb.jpeg",
    "https://i.ytimg.com/vi/85gnUXcd_T4/mqdefault.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
  }
}

class ProfileImageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<int> upload(File image) async {
    try {
      List<int> imageBytes = image.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      int status = await profileImagePost(base64Image);
      if (status == 200) {
        return 0;
      } else {
        return 1;
      }
    } catch (e) {
      return 1;
    }
  }
}
