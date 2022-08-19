// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:io';

import 'package:emojumo/controller/image_controller.dart';
import 'package:emojumo/controller/user_controller.dart';
import 'package:emojumo/data/API/api_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/navigationbar_controller.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingPageController());
    final gridController = Get.put(GridController());
    final userMomController = Get.arguments;
    final profileImageController = Get.put(ProfileImageController());
    final feedImageController = Get.put(FeedImageController());
    gridController.getImages();
    return Scaffold(
      appBar: AppBar(
        title: const Text("마이 페이지"),
        centerTitle: true,
        backgroundColor: controller.main_color,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: SizedBox(
                  height: 220,
                  child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: GestureDetector(
                          onTap: () async {
                            var picker = ImagePicker();
                            XFile? f = await picker.pickImage(
                                source: ImageSource.gallery);
                            File image = File(f!.path);
                            await profileImageController.upload(image);
                            await userMomController.getUserMom();
                            setState(() {});
                          },
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                'http://$ip_adress/images/${userMomController.userMom.image}/'),
                            backgroundColor: Colors.transparent,
                          ))),
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("이름: ???"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("생년월일: ???"),
                    SizedBox(
                      height: 20,
                    ),
                    Text("추가 정보~~추가 정보~~추가 정보~~추가 정보~~추가 정보~~추가 정보~~추가 정보~~"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  height: 190,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 30,
                        child: IconButton(
                          icon: Icon(Icons.settings),
                          onPressed: () {
                            Get.toNamed("/profileSetting");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    var picker = ImagePicker();
                    XFile? f =
                        await picker.pickImage(source: ImageSource.gallery);
                    File image = File(f!.path);
                    await feedImageController.upload(image);
                    await gridController.getImages();
                    setState(() {});
                  },
                  icon: Icon(Icons.add_box_outlined),
                  iconSize: 40,
                ),
              ],
            ),
          ),
          Expanded(
              child: GridView.count(
                  padding: const EdgeInsets.all(10),
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  crossAxisCount: 3,
                  children: gridController.images
                      .map(
                        (e) => GestureDetector(
                          child: Image.network(
                            'http://$ip_adress/images/$e/',
                            fit: BoxFit.fitHeight,
                          ),
                          onTap: () {
                            Get.dialog(Dialog(
                              child:
                                  Image.network('http://$ip_adress/images/$e/'),
                            ));
                          },
                        ),
                      )
                      .toList()))
        ],
      ),
    );
  }
}
