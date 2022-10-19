// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import '../util/colors.dart';
import '../util/style.dart';
import '../widgets/my_textField.dart';

class AddUserPage extends StatelessWidget {
  final nameController = TextEditingController();
  final jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        foregroundColor: btnColor,
        backgroundColor: cardColor,
        title: Text(
          'Add User',
          style: mediamBold,
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          children: [
            MyTextField(
              controller: nameController,
              hintText: 'Name',
              prefixIcon: Icons.person,
            ),
            SizedBox(height: 10),
            MyTextField(
              controller: jobController,
              hintText: 'Job',
              prefixIcon: Icons.circle,
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                  onPressed: () {
                    Get.find<UserController>()
                        .addUser(nameController.text, jobController.text);
                  },
                  child: Text('Submit')),
            )
          ],
        ),
      ),
    );
  }
}
