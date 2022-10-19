// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/user_controller.dart';
import '../route/my_app_route.dart';
import '../util/colors.dart';
import '../util/style.dart';

class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: cardColor,
        title: GetBuilder(
          init: UserController(),
          builder: (controller) {
            return Get.find<UserController>().userModel == null
                ? Text(
                    'No Data',
                    style: mediamBold,
                  )
                : Text(
                    Get.find<UserController>()
                        .userModel!
                        .data
                        .length
                        .toString(),
                    style: mediamBold,
                  );
          },
        ),
      ),
      body: Get.find<UserController>().userModel == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: Get.find<UserController>().userModel!.data.length,
              itemBuilder: (context, index) {
                final userM = Get.find<UserController>().userModel!.data[index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                    leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(userM.avatar),
                      ),
                    ),
                    title: Text(userM.firstName + userM.lastName),
                    subtitle: Text(userM.email),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(MyRoute.addUserPageRoute);
        },
      ),
    );
  }
}
