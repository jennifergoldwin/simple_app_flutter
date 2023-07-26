import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_app_flutter/modules/list/list_controller.dart';

import '../../utils/constants.dart';

class ListPage extends StatelessWidget{
  const ListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListController>(
      builder: (controller)=>Scaffold(
        body: (Obx(() =>  Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List<Widget>.generate(
                controller.pathName.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ChoiceChip(
                  label: Text(controller.pathName[index]),
                  selected: controller.selectedIndex.value == index,
                  onSelected: (selected) {
                      controller.selectedIndex.value = selected ? index : 0;
                      controller.fetchCharacters();
                  },
                ),
                    ),
              ).toList(),),
            ),
            controller.isLoading
                ? const Center(child: CircularProgressIndicator()) :
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(controller.listData.length, (index) {
                  return Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                          child: CachedNetworkImage(
                            imageUrl: controller.listData[index].url,
                            fit: BoxFit.cover,
                            errorWidget: (context,url,error){
                              return Icon(Icons.image,color: Colors.grey.withOpacity(0.6),size: 40,);
                            },
                            height: 150,
                            width: 150,
                          ),
                        ),
                        Text(controller.listData[index].name,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),)
                      ],
                    ),
                  );
                })
                // ListView.separated(
                //   separatorBuilder: (BuildContext context, int index) {
                //     return const SizedBox(height: 20);
                //   },
                //   itemCount: controller.listUser.length,
                //   physics: const ScrollPhysics(),
                //   itemBuilder: (context,index){
                //     return Container(
                //       decoration: const BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //       ),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         children: [
                //           ClipRRect(
                //             borderRadius:
                //             const BorderRadius.all(Radius.circular(12.0)),
                //             child: CachedNetworkImage(
                //               imageUrl: controller.listUser[index].avatarUrl,
                //               fit: BoxFit.cover,
                //               height: 150,
                //               width: 150,
                //             ),
                //           ),
                //           Text(controller.listUser[index].name)
                //         ],
                //       ),
                //     );
                //   },
                //
                // ),
              ),
            )
          ],
        )))
      ),
    );
  }
}