import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:simple_app_flutter/api/api_handler.dart';
import 'package:simple_app_flutter/utils/constants.dart';

import '../../models/Genshin.dart';

class ListController extends GetxController{
  ApiHandler apiHandler = ApiHandler();
  var pathName = ["characters","elements","nations","weapons"];
  var selectedIndex = 0.obs;
  List<Genshin> listData = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    fetchCharacters();
  }

  void fetchCharacters() async {
    listData.clear();
    debugPrint(selectedIndex.value.toString());
    var response = await apiHandler.getData(pathName[selectedIndex.value]);

    if(response != null){
      isLoading = false;
      response.forEach((data) {
        var pathUrl = data["name"].toString().toLowerCase();
        if (!pathUrl.contains("traveler")){
          var url = '$baseURL${pathName[selectedIndex.value]}/';

          if (pathUrl.trim().split(" ").length>=2){
            var temp = pathUrl.split(" ");
            if (pathUrl.contains("ayaka")){
              pathUrl ="ayaka";
            }else if (pathUrl.contains("kazuha")){
              pathUrl = "kazuha";
            }else if (pathUrl.contains("kokomi")){
              pathUrl = "kokomi";
            } else if (pathUrl.contains("sara")){
              pathUrl = "sara";
            }else if (pathUrl.contains("shogun")){
              pathUrl = "shogun";
            }
            else{
              pathUrl = "${temp[0]}-${temp[1]}";
            }
          }
          if (selectedIndex.value==0){
            url+= "$pathUrl/card";
          }else{
            url+= "$pathUrl/icon";
          }
          listData.add(Genshin.fromMap(data,url));
        }
      });
      update();
    }
  }
}