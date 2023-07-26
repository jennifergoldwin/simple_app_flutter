import 'package:get/get.dart';
import 'package:simple_app_flutter/modules/home/home_binding.dart';
import 'package:simple_app_flutter/modules/home/home_page.dart';
import 'package:simple_app_flutter/modules/login/login_binding.dart';
import 'package:simple_app_flutter/modules/login/login_page.dart';
import 'package:simple_app_flutter/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
  ];
}