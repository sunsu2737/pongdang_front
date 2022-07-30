// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:emojumo/controller/slider_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import '../../controller/navigationbar_controller.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LandingPageController());
    final sliderController = Get.put(SliderController());

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
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            bundle: null, 'assets/default_profile.png'),
                        radius: 120,
                      )),
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
            height: 50,
          ),
          SizedBox(
              height: 200,
              child: CarouselSlider(
                
                options: CarouselOptions(
                  
                    enableInfiniteScroll: false, viewportFraction: 0.7),
                items: sliderController.images
              )),
        ],
      ),
    );
  }
}
