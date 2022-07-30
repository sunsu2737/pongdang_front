// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

final TextStyle selectedLabelStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: landingPageController.main_color,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 0),
                  child: Icon(
                    Icons.home,
                    size: 30.0,
                  ),
                ),
                label: '홈',
                backgroundColor: landingPageController.main_color,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 0),
                  child: Icon(
                    Icons.chat_rounded,
                    size: 30.0,
                  ),
                ),
                label: '채팅',
                backgroundColor: landingPageController.main_color,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 0),
                  child: Icon(
                    Icons.location_history,
                    size: 30.0,
                  ),
                ),
                label: '내 정보',
                backgroundColor: landingPageController.main_color,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 0),
                  child: Icon(
                    Icons.settings,
                    size: 30.0,
                  ),
                ),
                label: '환경 설정',
                backgroundColor: landingPageController.main_color,
              ),
            ],
          ),
        )));
  }