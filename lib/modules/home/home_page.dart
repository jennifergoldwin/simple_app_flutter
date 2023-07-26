import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_app_flutter/modules/calculator/calculator_page.dart';
import 'package:simple_app_flutter/modules/camera/camera_page.dart';
import 'package:simple_app_flutter/modules/home/home_controller.dart';
import 'package:simple_app_flutter/modules/list/list_page.dart';
import 'package:simple_app_flutter/modules/login/login_page.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  bottomNavBar(context, HomeController controller){
    return Obx(() => MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(height: 62,
        child: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex.value,
          backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
          unselectedItemColor: Colors.white.withOpacity(0.5),
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Container(
              margin: const EdgeInsets.only(bottom: 7),
              child: const Icon(
                Icons.view_list_outlined,
                size: 20.0,),
              ),
              label: 'List',
              backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.camera_alt,
                  size: 20.0,),
              ),
              label: 'Camera',
              backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: const EdgeInsets.only(bottom: 7),
                child: const Icon(
                  Icons.calculate,
                  size: 20.0,),
              ),
              label: 'Calculator',
              backgroundColor: const Color.fromRGBO(36, 54, 101, 1.0),
            ),
          ],
        ),)
    ));
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller)=>Scaffold(
        appBar: AppBar(title: const Text("Home Page"),),
        bottomNavigationBar: bottomNavBar(context, controller),
        body: Obx(()=>IndexedStack(
          index: controller.tabIndex.value,
          children:  const [
            ListPage(),
            CameraPage(),
            CalculatorPage()
          ],
        )),
      ),
    );
  }

}
