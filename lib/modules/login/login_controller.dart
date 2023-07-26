import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_app_flutter/routes/app_routes.dart';

class LoginController extends GetxController{
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  submitLogin(){
    if (formKey.currentState!.validate()){
      Get.toNamed(AppRoutes.home);
    }
  }

  bool checkPalindrome(String str){
    return str == str.split("").reversed.join().toString();
  }
  bool checkAnagram(){
    int len1 = usernameController.value.text.length;
    int len2 = passwordController.value.text.length;

    if (len1!=len2){
      return false;
    }
    if (len1==0 || len2==0){
      return false;
    }
    List<String> usernameList = usernameController.value.text.split("");
    List<String> passwordList = passwordController.value.text.split("");

    usernameList.sort;
    passwordList.sort;

    if (usernameList.join().toString() == passwordList.join().toString()){
      return true;
    }
    return false;
  }

}