import 'dart:convert';

import '../../data/API/user_model.dart';
import 'package:http/http.dart' as http;
import 'api_resource.dart';

Future<int> signupPost(UserMom userMom) async {
  var url = Uri.parse('http://$ip_adress/user/create/');

  http.Response response = await http.post(url, body: userMom.toJson());

  return response.statusCode;
}

Future<int> loginPost(UserMom userMom) async {
  var url = Uri.parse('http://$ip_adress/user/login/');

  http.Response response = await http.post(url, body: userMom.toJson());
  if (response.statusCode == 200) {
    token = jsonDecode(response.body)['token'];
  }
  return response.statusCode;
}

Future<int> profileImagePost(String base64Image) async {
  var url = Uri.parse('http://$ip_adress/user/profileImage/');
  http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, // this header is essential to send json data
    body: jsonEncode([
      {
        'image': '$base64Image',
        'token': token
      }
    ]),
  );

  return response.statusCode;
}

Future<UserMom> getProfile() async {
  var url = Uri.parse('http://$ip_adress/user/profile/');
  UserMom profile = UserMom();
  http.Response response = await http.post(url, body: {"token": token});
  if (response.statusCode == 200) {
    profile = UserMom.fromJson(jsonDecode(response.body));
  }

  return profile;
}
