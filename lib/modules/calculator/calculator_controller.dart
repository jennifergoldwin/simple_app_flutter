import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController{
  var number = 0.obs;
  var fibonacciNumber = 0.obs;
  var listNumber = [].obs;
  var factorialNumber = 0.obs;
  var showNumber = 0.obs;

  incrementNumber(){
    number.value += 1;
    factorialNumber.value = generateFactorial(number.value);
    fibonacciNumber.value = fibonacci(number.value);
  }
  decrementNumber(){
    if (number.value>0){
      number.value -=1;
      factorialNumber.value = generateFactorial(number.value);
      fibonacciNumber.value = fibonacci(number.value);
    }
  }
  addToList(){
    listNumber.add(number.value);
  }

  int fibonacci(int n){
    debugPrint(n.toString());
    if (n == 0 || n == 1) {
      return n;
    }
    return fibonacci(n - 1) + fibonacci(n - 2);
  }
  find2ndLargestNumber(){
    if (listNumber.isNotEmpty){
      listNumber.sort;
      showNumber.value = listNumber[listNumber.length-2];
    }
  }
  findLargestNumber(){
    if (listNumber.isNotEmpty){
      listNumber.sort;
      showNumber.value = listNumber[listNumber.length-1];
    }
    var max = 0;
    //another solution
    for (var i = 0 ; i < listNumber.length ; i++){
      if (listNumber[i]>max){
        max = listNumber[i];
      }
    }
  }
  findSmallestNumber(){
    if (listNumber.isNotEmpty){
      listNumber.sort;
      showNumber.value = listNumber[0];
    }
    var min = 100000000000000;
    //another solution
    for (var i = 0 ; i < listNumber.length ; i++){
      if (listNumber[i]<min){
        min = listNumber[i];
      }
    }
  }
  int generateFactorial(int n){
    if (n>=1) {
      return n*generateFactorial(n-1);
    } else {
      return 1;
    }
  }

}