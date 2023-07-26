import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_app_flutter/modules/camera/camera_controller.dart';

class CameraPage extends StatefulWidget{
  const CameraPage({super.key});

  @override
  State<StatefulWidget> createState() => _CameraPageState();

}
class _CameraPageState extends State<CameraPage>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraController>(
      init: CameraController(),
      builder: (controller)=>Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() => controller.selectedImagePath.isEmpty
                  ? Container(
                padding:  const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                child: const Icon(Icons.camera_alt,size: 76.0,color: Colors.grey,),
              ) : Image.file(File(controller.selectedImagePath.value))),

              GestureDetector(
                onTap: ()=> controller.getImage(ImageSource.camera),
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.blue),
                  child: const Text(
                    'Camera',
                    style:TextStyle(color: Colors.white, fontSize: 26.0) ,),
                ),
              ),
            ],
          ),
        )
        ),
      );
  }

}
