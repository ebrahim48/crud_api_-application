// ignore_for_file: avoid_print, unused_local_variable

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  UserModel? userModel;

  @override
  void onInit() {
    getAllUser();
    super.onInit();
  }

  getAllUser() async {
    final uri = Uri.parse('https://reqres.in/api/users');
    final response = await get(uri);
    final json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      userModel = UserModel.fromJson(json);
      print(userModel!.data.length);
    } else {
      print(response.statusCode);
    }
    update();
  }

  addUser(String name, String job) async {
    final uri = Uri.parse('https://reqres.in/api/users');
    final response = await post(uri, body: {
      'name': name,
      'job': job,
    });

    if (response.statusCode == 201) {
      final json = jsonEncode(response.body);
      print(json);
      Get.snackbar('Message', 'Sucessfully added');
    } else {
      print(response.statusCode);
      Get.snackbar('Message', 'Failed');
    }
    update();
  }
}
