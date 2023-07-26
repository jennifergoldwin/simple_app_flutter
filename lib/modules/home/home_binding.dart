import 'package:get/get.dart';
import 'package:simple_app_flutter/modules/calculator/calculator_controller.dart';
import 'package:simple_app_flutter/modules/camera/camera_controller.dart';
import 'package:simple_app_flutter/modules/home/home_controller.dart';
import 'package:simple_app_flutter/modules/list/list_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => CalculatorController());
    Get.lazyPut(() => ListController());
    Get.lazyPut(() => CameraController());
  }

}