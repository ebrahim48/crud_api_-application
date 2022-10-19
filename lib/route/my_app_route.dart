// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import '../binding/all_binding.dart';
import '../views/add_user_page.dart';
import '../views/user_list_page.dart';

class MyRoute {
  static const userListPageRoute = '/user-list';
  static const addUserPageRoute = '/user-add';

  static final List<GetPage> pages = [
    GetPage(
      name: userListPageRoute,
      page: () => UserListPage(),
      binding: AllBinding(),
    ),
    GetPage(
      name: addUserPageRoute,
      page: () => AddUserPage(),
    ),
  ];
}
