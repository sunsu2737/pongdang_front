// ignore_for_file: prefer_const_constructors


import 'package:emojumo/screen/page/profile_setting.dart';
import 'package:emojumo/screen/page/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/landing.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '퐁당 퐁당',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Landing(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => Landing()),
        GetPage(name: "/signup", page: () => Signup()),
        GetPage(name: "/profileSetting", page: () => ProfileSetting()),
        


      ],
    );
  }
}
