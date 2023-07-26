
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:simple_app_flutter/utils/constants.dart';

class ApiHandler{
  final dio = Dio(BaseOptions(baseUrl: baseURL));

  Future<dynamic> getData(path) async {
    final response = await dio.get('$path/all');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return null;
    }
  }
}