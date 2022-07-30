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
  var url = Uri.parse('http://$ip_adress/rest-auth/login/');

  http.Response response = await http.post(url, body: userMom.toJson());
  token = jsonDecode(response.body)['key'];

  return response.statusCode;
}
