import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class AllBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController());
  }
}
