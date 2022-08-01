import 'package:emojumo/data/API/user_api.dart';
import 'package:get/get.dart';
import '../data/API/user_api.dart';
import '../data/API/user_model.dart';

class UserMomController extends GetxController {
  late UserMom userMom;

  @override
  void onInit() {
    super.onInit();
    
  }

  getUserMom() async {
    userMom = await getProfile();
  }

}
