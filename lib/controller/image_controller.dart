// ignore_for_file: unnecessary_overrides, prefer_const_constructors, non_constant_identifier_names

import 'dart:io';
import 'dart:convert';
import 'package:emojumo/data/API/user_api.dart';
import 'package:emojumo/data/API/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class GridController extends GetxController {
  List<String> images = [];

  @override
  void onInit() {
    super.onInit();
  }

  getImages() async {
    Feed feed = await getFeed();
    images = feed.images!;
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

class FeedImageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  Future<int> upload(File image) async {
    try {
      List<int> imageBytes = image.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      int status = await FeedImagePost(base64Image);
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
