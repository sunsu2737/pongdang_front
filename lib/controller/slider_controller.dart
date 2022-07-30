// ignore_for_file: unnecessary_overrides, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderController extends GetxController {
  var images = [
    "https://img.insight.co.kr/static/2019/09/26/700/t2q46y20edlnh3396x24.jpg",
    "https://image.fmkorea.com/files/attach/new/20191026/486616/657118072/2319685464/3b655332b9f134c56574c9183abbaebb.jpeg",
    "https://i.ytimg.com/vi/85gnUXcd_T4/mqdefault.jpg",
  ].map((url) {
    return GestureDetector(
      onTap: () {
        print(url);
      },
      child: Center(child: Image.network(url)),
    );
  }).toList();

  @override
  void onInit() {
    super.onInit();
  }
}
