import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_app_flutter/modules/calculator/calculator_controller.dart';

class CalculatorPage extends StatefulWidget{
  const CalculatorPage({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorPageState();

}
class _CalculatorPageState extends State<CalculatorPage>{
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalculatorController>(
      builder: (controller)=>Scaffold(
        body: Obx(()=> Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => controller.decrementNumber(),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.blue),
                          child: const Icon(Icons.remove, color: Colors.white,size: 20.0,),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                        child: Text(controller.number.value.toString(), style:
                        const TextStyle(color: Color(0xFF6D72FF), fontSize: 36.0),),
                      ),
                      GestureDetector(
                        onTap: () => controller.incrementNumber(),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.blue),
                          child: const Icon(Icons.add,color: Colors.white,size: 20.0,),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black, width: 1.0)),
                        child: Column(
                          children: [
                            Text("${controller.number.value}th Fibonacci",
                              style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            Text(controller.fibonacciNumber.value.toString(),
                            style: const TextStyle(color: Color(0xFF6D72FF),fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.white,borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.black, width: 1.0)),
                        child: Column(
                          children: [
                            Text("Factorial number ${controller.number}",
                              style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            Text(controller.factorialNumber.value.toString(),
                              style: const TextStyle(color: Color(0xFF6D72FF),fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.blue),
                      child: const Text(
                        'Add to List',
                        style:TextStyle(color: Colors.white, fontSize: 16.0) ,),
                    ),
                    onTap: ()=> controller.addToList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: ()=>controller.findLargestNumber(),
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.blue),
                            child: const Text(
                              'Largest number',
                              style:TextStyle(color: Colors.white, fontSize: 12.0) ,),
                          ),
                        ),
                        GestureDetector(
                          onTap: ()=>controller.find2ndLargestNumber(),
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.blue),
                            child: const Text(
                              '2nd largest number',
                              style:TextStyle(color: Colors.white, fontSize: 12.0) ,),
                          ),
                        ),
                        GestureDetector(
                          onTap: ()=>controller.findSmallestNumber(),
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0),color: Colors.blue),
                            child: const Text(
                              'Smallest number',
                              style:TextStyle(color: Colors.white, fontSize: 12.0) ,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.black, width: 1.0)),
                    child: Text(controller.showNumber.value.toString(), style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ListView.builder(
                          itemBuilder: (context, index){
                            return Container(
                              margin: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: Colors.blueAccent,width: 1.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      // offset: const Offset(0,3),
                                    )
                                  ]
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16.0),
                              child: Text(controller.listNumber[index].toString()),
                            );
                          },
                          itemCount: controller.listNumber.length),
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

}
